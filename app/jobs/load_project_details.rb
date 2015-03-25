require 'open-uri'

class LoadProjectDetails < ActiveJob::Base
  RUBYGEMS_API = 'https://rubygems.org/api/v1'

  def perform project
    @project = project
    return if @project.error_message.present?
    load_rubygems
    load_github if @project.github.present?
    @project.save
  rescue => e
    @project.error_message = e.message + "\n" + e.backtrace.join("\n")
    @project.save
  end

  def load_github
    @project.watchers = git_info.watchers_count
    @project.forks  = git_info.forks_count
    @project.first_commit_at = git_info.created_at
    @project.last_commit_at = git_info.pushed_at
  end

  def load_rubygems
    @project.website = gem_info[:homepage_uri]
    @project.wiki = gem_info[:wiki_uri]
    @project.rdoc = gem_info[:documentation_uri]
    @project.mailing_list = gem_info[:mailing_list_uri]
    @project.source_code = gem_info[:source_code_uri]
    @project.bug_tracker = gem_info[:bug_tracker_uri]
    @project.github = @project.source_code || @project.website
    @project.downloads = gem_info[:downloads]
    @project.depending_gems = gem_info[:dependencies]['runtime'].count

    @project.description = latest[:description]
    @project.releases = versions.count
    @project.latest_version = latest[:number]
    @project.released_at = latest[:built_at]
    @project.first_released_at = first[:built_at]
  end

  def latest
    versions.first
  end

  def first
    versions.last
  end

  def versions
    @versions ||= JSON.parse(open("#{RUBYGEMS_API}/versions/#{@project.name}.json").read).map(&:symbolize_keys)
  end

  def gem_info
    @gem_info ||= JSON.parse(open("#{RUBYGEMS_API}/gems/#{@project.name}.json").read).symbolize_keys
  end

  def git_info
    @git_info ||= begin
      org, name = * /.*\.com\/([^\/]*)\/([^\/]*)/.match(@project.github).to_a[1..2]
      Github.new.repos.get org, name
    end.response.body
  end
end
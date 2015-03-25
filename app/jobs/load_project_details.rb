
require 'open-uri'

class LoadProjectDetails < ActiveJob::Base
  def perform project
    @project = project
    @project.downloads = data.map{|d|d[:downloads_count].to_i}.compact.inject(&:+)
    @project.description = latest[:description]
    @project.popularity = @project.downloads
    @project.releases = data.count
    @project.latest_version = latest[:number]
    @project.released_at = latest[:built_at]
    @project.first_released_at = first[:built_at]
    @project.save
  end

  def latest
    data.first
  end

  def first
    data.last
  end

  def data
    @data ||= JSON.parse(open("https://rubygems.org/api/v1/versions/#{@project.name}.json").read).map(&:symbolize_keys)
  end
end
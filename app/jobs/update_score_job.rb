class UpdateScoreJob < ActiveJob::Base
  def perform
    Project.all.each do |project|
      calculate_popularity project
    end
  end

  def calculate_popularity project
    return if required_value_is_missing project
    project.popularity = (gem_score(project) + github_score(project)) / 2.0
    project.save
  end

  def gem_score(project)
    100.0 / max_downloads * project.downloads
  end

  def github_score(project)
    100.0 / (max_forks + max_watchers) * (project.forks + project.watchers)
  end

  def required_value_is_missing(project)
    !(project.watchers && project.forks && project.downloads)
  end

  def max_watchers
    @max_watchers ||= Project.all.maximum(:watchers) || 0
  end

  def max_forks
    @max_forks ||= Project.all.maximum(:forks) || 0
  end

  def max_downloads
    @max_downloads ||= Project.all.maximum(:downloads) || 0
  end
end
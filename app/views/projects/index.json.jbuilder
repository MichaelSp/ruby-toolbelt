json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :popularity, :website, :rdoc, :wiki, :source_code, :bug_tracker, :mailing_list, :downloads, :releases, :latest_version, :released_at, :first_released_at, :depending_gems, :github, :watchers, :forks, :activity, :last_commit_at, :first_commit_at, :contributors, :issues
  json.url project_url(project, format: :json)
end

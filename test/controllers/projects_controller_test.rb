require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { activity: @project.activity, bug_tracker: @project.bug_tracker, contributors: @project.contributors, depending_gems: @project.depending_gems, description: @project.description, downloads: @project.downloads, first_commit_at: @project.first_commit_at, first_released_at: @project.first_released_at, forks: @project.forks, github: @project.github, issues: @project.issues, last_commit_at: @project.last_commit_at, latest_version: @project.latest_version, mailing_list: @project.mailing_list, name: @project.name, popularity: @project.popularity, rdoc: @project.rdoc, released_at: @project.released_at, releases: @project.releases, source_code: @project.source_code, watchers: @project.watchers, website: @project.website, wiki: @project.wiki }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @project, project: { activity: @project.activity, bug_tracker: @project.bug_tracker, contributors: @project.contributors, depending_gems: @project.depending_gems, description: @project.description, downloads: @project.downloads, first_commit_at: @project.first_commit_at, first_released_at: @project.first_released_at, forks: @project.forks, github: @project.github, issues: @project.issues, last_commit_at: @project.last_commit_at, latest_version: @project.latest_version, mailing_list: @project.mailing_list, name: @project.name, popularity: @project.popularity, rdoc: @project.rdoc, released_at: @project.released_at, releases: @project.releases, source_code: @project.source_code, watchers: @project.watchers, website: @project.website, wiki: @project.wiki }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end

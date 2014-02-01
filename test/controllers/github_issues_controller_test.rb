require 'test_helper'

class GithubIssuesControllerTest < ActionController::TestCase
  setup do
    @github_issue = github_issues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:github_issues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create github_issue" do
    assert_difference('GithubIssue.count') do
      post :create, github_issue: { index: @github_issue.index }
    end

    assert_redirected_to github_issue_path(assigns(:github_issue))
  end

  test "should show github_issue" do
    get :show, id: @github_issue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @github_issue
    assert_response :success
  end

  test "should update github_issue" do
    patch :update, id: @github_issue, github_issue: { index: @github_issue.index }
    assert_redirected_to github_issue_path(assigns(:github_issue))
  end

  test "should destroy github_issue" do
    assert_difference('GithubIssue.count', -1) do
      delete :destroy, id: @github_issue
    end

    assert_redirected_to github_issues_path
  end
end

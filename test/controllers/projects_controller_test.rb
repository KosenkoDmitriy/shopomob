require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should contain project title" do
    get :show, id: @project
    assert_select 'h1', text: 'Project1'
  end
end

require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should show project" do
    get :show, id: @project
    assert_respone :success
  end
end

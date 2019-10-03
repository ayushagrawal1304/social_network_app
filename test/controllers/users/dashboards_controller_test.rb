require 'test_helper'

class Users::DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_dashboards_index_url
    assert_response :success
  end

end

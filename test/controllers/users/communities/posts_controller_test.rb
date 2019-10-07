require 'test_helper'

class Users::Communities::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_communities_posts_new_url
    assert_response :success
  end

end

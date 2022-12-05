require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    login_as(@user)
    get users_path
    assert_response :success
  end
end

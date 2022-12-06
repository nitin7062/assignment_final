require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:michael)
    @other_user = users(:achal)
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to new_user_session_path
  end

  test "should get index" do
    sign_in @user
    get users_path
    assert_response :found
  end

  test "should get show" do
    sign_in @user
    get user_path(@user)
    assert_response :found
  end
end

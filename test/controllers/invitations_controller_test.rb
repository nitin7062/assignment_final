require "test_helper"

class InvitationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get invitations_create_url
    assert_response :success
  end

  test "should get destory" do
    get invitations_destory_url
    assert_response :success
  end

  test "should get update" do
    get invitations_update_url
    assert_response :success
  end
end

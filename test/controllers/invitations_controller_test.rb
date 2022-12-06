require "test_helper"

class InvitationsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @invitation = invitations(:one)
  end

  test "should get index" do
    sign_in @user
    get invitations_path
    assert_response :found
  end

  test "should get create" do
    sign_in @user
    post invitations_path
    assert_response :found
  end

  test "should get destory" do
    sign_in @user
    delete invitation_path(@invitation)
    assert_response :found
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Invitation.count' do
      delete invitation_path(@invitation)
    end
    assert_redirected_to new_user_session_path
  end

  test "should get update" do
    patch invitation_path(@invitation)
    assert_response :found
  end
end

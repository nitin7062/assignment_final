require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
  end
  test "first_name should be present" do
    @user.first_name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "role should be present" do
    @user.role = ""
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
    end
end

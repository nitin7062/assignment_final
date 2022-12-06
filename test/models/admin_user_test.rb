require "test_helper"

class AdminUserTest < ActiveSupport::TestCase
  def setup
    @admin = AdminUser.new(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  end

  test "email_should be present" do
    @admin.email = " "
    assert_not @admin.valid?
  end

  test "password_should be present" do
    @admin.password = " "
    assert_not @admin.valid?
  end
end

require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                        password: "foobar", password_confirmation: "foobar")
  end
  #valid or not check
  test "should be valid" do
    assert @user.valid?
  end
  #checking the name is present or not
  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end
  #checking the email is present or not
  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end
  #checking the length should be not too long for name

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end
  #checking the length should be not too long for email
  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
  #checking the Format validation for email
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                                            foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  #checking Uniqueness validation for email.
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
  #checking password validation
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
  #password should have a minimum length
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  #authenticated? should return false for a user with nil digest
  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end
end

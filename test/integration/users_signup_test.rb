require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  # testing for invalid information
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user:  { name: "",
                                          email: "user@invalid",
                                          password: "foo",
                                          password_confirmation: "bar"
                                        }
                                }
    end
    assert_template 'users/new'
  end
  # testing for valid information
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
    post users_path, params: { user: {  name: "Example User",
                                        email: "user@example.com",
                                        password: "password",
                                        password_confirmation: "password"
                                     }
                              }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end

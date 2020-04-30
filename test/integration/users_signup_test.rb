require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, params: {user: {name: " ",
                                       email: "   ",      
                                       password: "hoge", 
                                       password_confirmation: "fuga"}}
    end
    assert_select 'div#error_explanation'
    assert_select 'div.alert-danger'
    assert_template "users/new"
  end
  
  test "valid signup" do
    get signup_path
    assert_difference "User.count", 1 do
      post users_path, params: {user: {name: "example",
                                       email: "hoge111@gmail.com",      
                                       password: "hogefuga", 
                                       password_confirmation: "hogefuga"}}
    end
    follow_redirect!
    assert_template "static_pages/home"
    assert_not flash.empty?
    assert is_logged_in?
  end
end

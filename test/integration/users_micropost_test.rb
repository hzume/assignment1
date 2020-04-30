require 'test_helper'

class UsersMicropostTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:hogehoge)
  end
  
  test "microposts show" do
    get user_path(@user)
    assert_template "users/show"
    assert_match @user.microposts.count.to_s, response.body
    @user.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
  end
  
  test "microposts search" do
    get user_path(@user), params: {search: "3"}
    assert_match @user.microposts.count.to_s, response.body
  end
  

end

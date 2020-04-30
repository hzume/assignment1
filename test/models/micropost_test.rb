require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:hogehoge)
    @micropost = @user.microposts.build(title: "ex movie", content: "good", year: 2020, month: 12, date: 31, theater: "my home")
  end
  
  test "should be valid" do
    assert @micropost.valid?
  end
  
  test "user_id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end
  
  test "content should be present" do
    @micropost.content = nil
    assert_not @micropost.valid?
  end
  
  test "content should not be too long" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end
  
  test "year should be present" do
    @micropost.year = nil
    assert_not @micropost.valid?
  end
  
  test "year should be integer" do
    @micropost.year = 3.5
    assert_not @micropost.valid?
  end

  test "year should be greater_than 1000" do
    @micropost.year = 10
    assert_not @micropost.valid?
  end
  
  test "year should be less_than 3000" do
    @micropost.year = 10000
    assert_not @micropost.valid?
  end

  test "month should be present" do
    @micropost.month = nil
    assert_not @micropost.valid?
  end
  
  test "month should be integer" do
    @micropost.month = 3.5
    assert_not @micropost.valid?
  end

  test "month should be greater_than 0" do
    @micropost.month = 0
    assert_not @micropost.valid?
  end
  
  test "month should be less_than 13" do
    @micropost.month = 13
    assert_not @micropost.valid?
  end

  test "date should be present" do
    @micropost.date = nil
    assert_not @micropost.valid?
  end
  
  test "date should be integer" do
    @micropost.date = 3.5
    assert_not @micropost.valid?
  end

  test "date should be greater_than 0" do
    @micropost.date = 0
    assert_not @micropost.valid?
  end
  
  test "date should be less_than 32" do
    @micropost.date = 32
    assert_not @micropost.valid?
  end
end

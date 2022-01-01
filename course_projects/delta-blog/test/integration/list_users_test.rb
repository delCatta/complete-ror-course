require "test_helper"

class ListUsersTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username:"Testing",email:"test@gmail.com",password:"password")
    @user2 = User.create(username:"Testing 2",email:"test2@gmail.com",password:"password")
  end
  
  test "should show categories listing" do
    get '/users'
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", user_path(@user2)
  end
end

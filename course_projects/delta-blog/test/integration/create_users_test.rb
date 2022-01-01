require "test_helper"

class CreateUsersTest < ActionDispatch::IntegrationTest
  def setup
    
  end
  test "get new user form and create user" do
    get "/login"
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: {user: {email: "test@gmail.com",username:"Testeandolo",password:"password"} }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Testeandolo", response.body
  end
  test "get new user form and reject invalid user submission" do
    get "/login"
    assert_response :success
    assert_no_difference 'User.count' do
      post users_path, params: {user: {email: " "} }
    end
    assert_match "Danger!", response.body
  end
end

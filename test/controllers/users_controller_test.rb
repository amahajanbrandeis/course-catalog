require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_url
    assert_response :success
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    get root_path
    assert_select "h1", "Log in"
    assert_response :success
  end

  test "should ping server" do
    url = 'http://localhost:3000'
    get url
    assert_response :success
  end

  test "can see welcome page" do
    get '/'
    assert_select "h1", "Log in"
    assert_response :success
  end

  test "login with valid information" do
    post users_path, params: { user: { name: "Example", email: "test@example.com", password: "password", password_confirmation: "password" } }
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "test@example.com", password: "password" } }
    get '/users/1'
    assert_template 'users/show'
    assert_select "h1", "Profile Page"
    assert_response :success
  end

  test "cannot access other users profile page" do
    post users_path, params: { user: { name: "Example", email: "test@example.com", password: "password", password_confirmation: "password" } }
    post users_path, params: { user: { name: "Example2", email: "test2@example.com", password: "password2", password_confirmation: "password2" } }
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "test2@example.com", password: "password2" } }
    get '/users/2'
    assert_template 'users/show'
    assert_select "p", "Name:
  Example2" #needed to format it this way for test to pass
    get '/users/1'
    assert_redirected_to root_url
    #assert_template 'users/show'
  end

  test "redirected to log in on logged out access of user page" do
    post users_path, params: { user: { name: "Example", email: "test@example.com", password: "password", password_confirmation: "password" } }
    get '/users/1'
    assert_redirected_to root_path
  end

end

require 'test_helper'

class EnrollmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enrollment = enrollments(:one)
  end

  test "should get index" do
    get enrollments_url
    assert_response :success
  end

  test "should get new" do
    get new_enrollment_url
    assert_response :success
  end

  test "should show enrollment" do
    get enrollment_url(@enrollment)
    assert_response :success
  end

  #test "should destroy enrollment" do
  #  assert_difference('Enrollment.count', -1) do
      #params[:user_id] = 1
  #    delete(:destroy, {'user_id' => 1}, {'course_id' => 1})
      #delete enrollment_url(@enrollment)
  #  end

  #  assert_redirected_to enrollments_url
  #end
  test "should search"
    post '/signup', params: { user: { name: "Example", email: "test@example.com", password: "password", password_confirmation: "password" } }
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "test@example.com", password: "password" } }
    get '/search'
    assert_template '/search'
end

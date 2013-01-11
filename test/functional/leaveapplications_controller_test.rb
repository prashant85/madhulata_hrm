require 'test_helper'

class LeaveapplicationsControllerTest < ActionController::TestCase
  setup do
    @leaveapplication = leaveapplications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leaveapplications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leaveapplication" do
    assert_difference('Leaveapplication.count') do
      post :create, leaveapplication: { comment: @leaveapplication.comment, description: @leaveapplication.description, from: @leaveapplication.from, leavetype: @leaveapplication.leavetype, name: @leaveapplication.name, subject: @leaveapplication.subject, to: @leaveapplication.to }
    end

    assert_redirected_to leaveapplication_path(assigns(:leaveapplication))
  end

  test "should show leaveapplication" do
    get :show, id: @leaveapplication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leaveapplication
    assert_response :success
  end

  test "should update leaveapplication" do
    put :update, id: @leaveapplication, leaveapplication: { comment: @leaveapplication.comment, description: @leaveapplication.description, from: @leaveapplication.from, leavetype: @leaveapplication.leavetype, name: @leaveapplication.name, subject: @leaveapplication.subject, to: @leaveapplication.to }
    assert_redirected_to leaveapplication_path(assigns(:leaveapplication))
  end

  test "should destroy leaveapplication" do
    assert_difference('Leaveapplication.count', -1) do
      delete :destroy, id: @leaveapplication
    end

    assert_redirected_to leaveapplications_path
  end
end

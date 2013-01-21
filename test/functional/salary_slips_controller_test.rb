require 'test_helper'

class SalarySlipsControllerTest < ActionController::TestCase
  setup do
    @salary_slip = salary_slips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_slips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_slip" do
    assert_difference('SalarySlip.count') do
      post :create, salary_slip: { deduction: @salary_slip.deduction, employtee_detail_id: @salary_slip.employtee_detail_id, gross_salary: @salary_slip.gross_salary, net_salary: @salary_slip.net_salary }
    end

    assert_redirected_to salary_slip_path(assigns(:salary_slip))
  end

  test "should show salary_slip" do
    get :show, id: @salary_slip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_slip
    assert_response :success
  end

  test "should update salary_slip" do
    put :update, id: @salary_slip, salary_slip: { deduction: @salary_slip.deduction, employtee_detail_id: @salary_slip.employtee_detail_id, gross_salary: @salary_slip.gross_salary, net_salary: @salary_slip.net_salary }
    assert_redirected_to salary_slip_path(assigns(:salary_slip))
  end

  test "should destroy salary_slip" do
    assert_difference('SalarySlip.count', -1) do
      delete :destroy, id: @salary_slip
    end

    assert_redirected_to salary_slips_path
  end
end

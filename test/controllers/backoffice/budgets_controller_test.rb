require 'test_helper'

class Backoffice::BudgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backoffice_budget = backoffice_budgets(:one)
  end

  test "should get index" do
    get backoffice_budgets_url
    assert_response :success
  end

  test "should get new" do
    get new_backoffice_budget_url
    assert_response :success
  end

  test "should create backoffice_budget" do
    assert_difference('Backoffice::Budget.count') do
      post backoffice_budgets_url, params: { backoffice_budget: { date: @backoffice_budget.date, expiration_date: @backoffice_budget.expiration_date, kind: @backoffice_budget.kind, note: @backoffice_budget.note, person_id: @backoffice_budget.person_id, state: @backoffice_budget.state, total_value: @backoffice_budget.total_value } }
    end

    assert_redirected_to backoffice_budget_url(Backoffice::Budget.last)
  end

  test "should show backoffice_budget" do
    get backoffice_budget_url(@backoffice_budget)
    assert_response :success
  end

  test "should get edit" do
    get edit_backoffice_budget_url(@backoffice_budget)
    assert_response :success
  end

  test "should update backoffice_budget" do
    patch backoffice_budget_url(@backoffice_budget), params: { backoffice_budget: { date: @backoffice_budget.date, expiration_date: @backoffice_budget.expiration_date, kind: @backoffice_budget.kind, note: @backoffice_budget.note, person_id: @backoffice_budget.person_id, state: @backoffice_budget.state, total_value: @backoffice_budget.total_value } }
    assert_redirected_to backoffice_budget_url(@backoffice_budget)
  end

  test "should destroy backoffice_budget" do
    assert_difference('Backoffice::Budget.count', -1) do
      delete backoffice_budget_url(@backoffice_budget)
    end

    assert_redirected_to backoffice_budgets_url
  end
end

require 'test_helper'

class Backoffice::BudgetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_budgets_index_url
    assert_response :success
  end

end

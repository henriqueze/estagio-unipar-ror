require 'test_helper'

class Backoffice::ItemBudgetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_item_budgets_index_url
    assert_response :success
  end

end

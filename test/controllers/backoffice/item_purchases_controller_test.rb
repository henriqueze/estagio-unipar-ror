require 'test_helper'

class Backoffice::ItemPurchasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_item_purchases_index_url
    assert_response :success
  end

end

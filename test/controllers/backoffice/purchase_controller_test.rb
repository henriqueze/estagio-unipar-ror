require 'test_helper'

class Backoffice::PurchaseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_purchase_index_url
    assert_response :success
  end

end

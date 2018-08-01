require 'test_helper'

class Backoffice::PurchasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_purchases_index_url
    assert_response :success
  end

end

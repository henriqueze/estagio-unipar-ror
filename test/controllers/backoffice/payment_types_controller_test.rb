require 'test_helper'

class Backoffice::PaymentTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_payment_types_index_url
    assert_response :success
  end

end

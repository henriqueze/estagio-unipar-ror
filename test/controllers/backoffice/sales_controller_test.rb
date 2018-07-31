require 'test_helper'

class Backoffice::SalesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_sales_index_url
    assert_response :success
  end

end

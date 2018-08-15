require 'test_helper'

class Backoffice::ProvidersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_providers_index_url
    assert_response :success
  end

end

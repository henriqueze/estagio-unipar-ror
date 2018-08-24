require 'test_helper'

class Backoffice::AjudaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_ajuda_index_url
    assert_response :success
  end

end

require 'test_helper'

class Backoffice::MasterUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_master_users_index_url
    assert_response :success
  end

end

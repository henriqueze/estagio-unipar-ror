require 'test_helper'

class Backoffice::AccountsPayablesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_accounts_payables_index_url
    assert_response :success
  end

end

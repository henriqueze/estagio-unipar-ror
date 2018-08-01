require 'test_helper'

class Backoffice::AccountsReceivablesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_accounts_receivables_index_url
    assert_response :success
  end

end

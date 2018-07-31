require 'test_helper'

class Backoffice::PeopleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_people_index_url
    assert_response :success
  end

end

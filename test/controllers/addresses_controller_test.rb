require "test_helper"

class AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get addresses_edit_url
    assert_response :success
  end
end

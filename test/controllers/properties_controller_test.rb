require "test_helper"

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  test "should get properties titles in the correct way" do
    get "/properties/get"
    assert_response :success
  end

  test "should show properties" do
    get properties_get_url(@data)
    assert_response :success
  end

end

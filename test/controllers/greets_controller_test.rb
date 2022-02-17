require 'test_helper'

class GreetsControllerTest < ActionDispatch::IntegrationTest
  test "should get greet" do
    get greets_greet_url
    assert_response :success
  end

end

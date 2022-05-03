require "test_helper"

class FriedRicesControllerTest < ActionDispatch::IntegrationTest
  test "should get preparation" do
    get fried_rices_preparation_url
    assert_response :success
  end

  test "should get result" do
    get fried_rices_result_url
    assert_response :success
  end
end

require "test_helper"

class FriedRiceControllerTest < ActionDispatch::IntegrationTest
  test "should get preparation" do
    get fried_rice_preparation_url
    assert_response :success
  end

  test "should get result" do
    get fried_rice_result_url
    assert_response :success
  end
end

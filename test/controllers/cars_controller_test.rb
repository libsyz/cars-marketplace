require "test_helper"

class CarsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get cars_index_url
    assert_response :success
  end

  # test "the truth" do
  #   assert true
  # end

end

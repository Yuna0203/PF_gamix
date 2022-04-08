require "test_helper"

class Customer::GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_games_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_games_show_url
    assert_response :success
  end

  test "should get new" do
    get customer_games_new_url
    assert_response :success
  end
end

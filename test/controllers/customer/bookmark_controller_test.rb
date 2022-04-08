require "test_helper"

class Customer::BookmarkControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_bookmark_index_url
    assert_response :success
  end
end

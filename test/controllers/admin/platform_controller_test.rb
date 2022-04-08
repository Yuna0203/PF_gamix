require "test_helper"

class Admin::PlatformControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_platform_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_platform_edit_url
    assert_response :success
  end
end

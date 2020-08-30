require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get shorturl" do
    get home_shorturl_url
    assert_response :success
  end

  test "should get stats" do
    get home_stats_url
    assert_response :success
  end

end

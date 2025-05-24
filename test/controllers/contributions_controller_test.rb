require "test_helper"

class ContributionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get contributions_new_url
    assert_response :success
  end

  test "should get create" do
    get contributions_create_url
    assert_response :success
  end
end

require 'test_helper'

class WebsitesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get websites_new_url
    assert_response :success
  end

end

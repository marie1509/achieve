require 'test_helper'

class VlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vlogs_index_url
    assert_response :success
  end

end

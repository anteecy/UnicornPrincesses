require 'test_helper'

class ApplicationformControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get applicationform_index_url
    assert_response :success
  end

end

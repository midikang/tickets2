require 'test_helper'

class DemoControllerTest < ActionController::TestCase
  test "should get mailbox" do
    get :mailbox
    assert_response :success
  end

end

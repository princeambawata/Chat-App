require 'test_helper'

class ChatroomControllerTest < ActionDispatch::IntegrationTest
  test "should get title:string" do
    get chatroom_title:string_url
    assert_response :success
  end

  test "should get user:references" do
    get chatroom_user:references_url
    assert_response :success
  end

end

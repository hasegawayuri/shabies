require "test_helper"

class UserroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userroom = userrooms(:one)
  end

  test "should get index" do
    get userrooms_url
    assert_response :success
  end

  test "should get new" do
    get new_userroom_url
    assert_response :success
  end

  test "should create userroom" do
    assert_difference('Userroom.count') do
      post userrooms_url, params: { userroom: { room_id: @userroom.room_id, user_id: @userroom.user_id } }
    end

    assert_redirected_to userroom_url(Userroom.last)
  end

  test "should show userroom" do
    get userroom_url(@userroom)
    assert_response :success
  end

  test "should get edit" do
    get edit_userroom_url(@userroom)
    assert_response :success
  end

  test "should update userroom" do
    patch userroom_url(@userroom), params: { userroom: { room_id: @userroom.room_id, user_id: @userroom.user_id } }
    assert_redirected_to userroom_url(@userroom)
  end

  test "should destroy userroom" do
    assert_difference('Userroom.count', -1) do
      delete userroom_url(@userroom)
    end

    assert_redirected_to userrooms_url
  end
end

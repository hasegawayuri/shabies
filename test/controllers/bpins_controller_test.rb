require "test_helper"

class BpinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bpin = bpins(:one)
  end

  test "should get index" do
    get bpins_url
    assert_response :success
  end

  test "should get new" do
    get new_bpin_url
    assert_response :success
  end

  test "should create bpin" do
    assert_difference('Bpin.count') do
      post bpins_url, params: { bpin: { board_id: @bpin.board_id, user_id: @bpin.user_id } }
    end

    assert_redirected_to bpin_url(Bpin.last)
  end

  test "should show bpin" do
    get bpin_url(@bpin)
    assert_response :success
  end

  test "should get edit" do
    get edit_bpin_url(@bpin)
    assert_response :success
  end

  test "should update bpin" do
    patch bpin_url(@bpin), params: { bpin: { board_id: @bpin.board_id, user_id: @bpin.user_id } }
    assert_redirected_to bpin_url(@bpin)
  end

  test "should destroy bpin" do
    assert_difference('Bpin.count', -1) do
      delete bpin_url(@bpin)
    end

    assert_redirected_to bpins_url
  end
end

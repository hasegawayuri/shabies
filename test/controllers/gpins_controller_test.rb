require "test_helper"

class GpinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gpin = gpins(:one)
  end

  test "should get index" do
    get gpins_url
    assert_response :success
  end

  test "should get new" do
    get new_gpin_url
    assert_response :success
  end

  test "should create gpin" do
    assert_difference('Gpin.count') do
      post gpins_url, params: { gpin: { group_id: @gpin.group_id, user_id: @gpin.user_id } }
    end

    assert_redirected_to gpin_url(Gpin.last)
  end

  test "should show gpin" do
    get gpin_url(@gpin)
    assert_response :success
  end

  test "should get edit" do
    get edit_gpin_url(@gpin)
    assert_response :success
  end

  test "should update gpin" do
    patch gpin_url(@gpin), params: { gpin: { group_id: @gpin.group_id, user_id: @gpin.user_id } }
    assert_redirected_to gpin_url(@gpin)
  end

  test "should destroy gpin" do
    assert_difference('Gpin.count', -1) do
      delete gpin_url(@gpin)
    end

    assert_redirected_to gpins_url
  end
end

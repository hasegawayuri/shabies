require "application_system_test_case"

class UserroomsTest < ApplicationSystemTestCase
  setup do
    @userroom = userrooms(:one)
  end

  test "visiting the index" do
    visit userrooms_url
    assert_selector "h1", text: "Userrooms"
  end

  test "creating a Userroom" do
    visit userrooms_url
    click_on "New Userroom"

    fill_in "Room", with: @userroom.room_id
    fill_in "User", with: @userroom.user_id
    click_on "Create Userroom"

    assert_text "Userroom was successfully created"
    click_on "Back"
  end

  test "updating a Userroom" do
    visit userrooms_url
    click_on "Edit", match: :first

    fill_in "Room", with: @userroom.room_id
    fill_in "User", with: @userroom.user_id
    click_on "Update Userroom"

    assert_text "Userroom was successfully updated"
    click_on "Back"
  end

  test "destroying a Userroom" do
    visit userrooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Userroom was successfully destroyed"
  end
end

require "application_system_test_case"

class BpinsTest < ApplicationSystemTestCase
  setup do
    @bpin = bpins(:one)
  end

  test "visiting the index" do
    visit bpins_url
    assert_selector "h1", text: "Bpins"
  end

  test "creating a Bpin" do
    visit bpins_url
    click_on "New Bpin"

    fill_in "Board", with: @bpin.board_id
    fill_in "User", with: @bpin.user_id
    click_on "Create Bpin"

    assert_text "Bpin was successfully created"
    click_on "Back"
  end

  test "updating a Bpin" do
    visit bpins_url
    click_on "Edit", match: :first

    fill_in "Board", with: @bpin.board_id
    fill_in "User", with: @bpin.user_id
    click_on "Update Bpin"

    assert_text "Bpin was successfully updated"
    click_on "Back"
  end

  test "destroying a Bpin" do
    visit bpins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bpin was successfully destroyed"
  end
end

require "application_system_test_case"

class GpinsTest < ApplicationSystemTestCase
  setup do
    @gpin = gpins(:one)
  end

  test "visiting the index" do
    visit gpins_url
    assert_selector "h1", text: "Gpins"
  end

  test "creating a Gpin" do
    visit gpins_url
    click_on "New Gpin"

    fill_in "Group", with: @gpin.group_id
    fill_in "User", with: @gpin.user_id
    click_on "Create Gpin"

    assert_text "Gpin was successfully created"
    click_on "Back"
  end

  test "updating a Gpin" do
    visit gpins_url
    click_on "Edit", match: :first

    fill_in "Group", with: @gpin.group_id
    fill_in "User", with: @gpin.user_id
    click_on "Update Gpin"

    assert_text "Gpin was successfully updated"
    click_on "Back"
  end

  test "destroying a Gpin" do
    visit gpins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gpin was successfully destroyed"
  end
end

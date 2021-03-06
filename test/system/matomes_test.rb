require "application_system_test_case"

class MatomesTest < ApplicationSystemTestCase
  setup do
    @matome = matomes(:one)
  end

  test "visiting the index" do
    visit matomes_url
    assert_selector "h1", text: "Matomes"
  end

  test "creating a Matome" do
    visit matomes_url
    click_on "New Matome"

    fill_in "Discription", with: @matome.discription
    fill_in "Like", with: @matome.like
    fill_in "Title", with: @matome.title
    fill_in "User", with: @matome.user_id
    click_on "Create Matome"

    assert_text "Matome was successfully created"
    click_on "Back"
  end

  test "updating a Matome" do
    visit matomes_url
    click_on "Edit", match: :first

    fill_in "Discription", with: @matome.discription
    fill_in "Like", with: @matome.like
    fill_in "Title", with: @matome.title
    fill_in "User", with: @matome.user_id
    click_on "Update Matome"

    assert_text "Matome was successfully updated"
    click_on "Back"
  end

  test "destroying a Matome" do
    visit matomes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Matome was successfully destroyed"
  end
end

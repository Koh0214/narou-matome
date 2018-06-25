require "application_system_test_case"

class NovelsTest < ApplicationSystemTestCase
  setup do
    @novel = novels(:one)
  end

  test "visiting the index" do
    visit novels_url
    assert_selector "h1", text: "Novels"
  end

  test "creating a Novel" do
    visit novels_url
    click_on "New Novel"

    fill_in "Amazon Url", with: @novel.amazon_url
    fill_in "Discription", with: @novel.discription
    fill_in "Matome", with: @novel.matome_id
    fill_in "Review", with: @novel.review
    fill_in "Title", with: @novel.title
    fill_in "Url", with: @novel.url
    click_on "Create Novel"

    assert_text "Novel was successfully created"
    click_on "Back"
  end

  test "updating a Novel" do
    visit novels_url
    click_on "Edit", match: :first

    fill_in "Amazon Url", with: @novel.amazon_url
    fill_in "Discription", with: @novel.discription
    fill_in "Matome", with: @novel.matome_id
    fill_in "Review", with: @novel.review
    fill_in "Title", with: @novel.title
    fill_in "Url", with: @novel.url
    click_on "Update Novel"

    assert_text "Novel was successfully updated"
    click_on "Back"
  end

  test "destroying a Novel" do
    visit novels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Novel was successfully destroyed"
  end
end

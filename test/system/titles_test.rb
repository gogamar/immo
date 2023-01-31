require "application_system_test_case"

class TitlesTest < ApplicationSystemTestCase
  setup do
    @title = titles(:one)
  end

  test "visiting the index" do
    visit titles_url
    assert_selector "h1", text: "Titles"
  end

  test "should create title" do
    visit titles_url
    click_on "New title"

    fill_in "Bbutton", with: @title.bbutton
    fill_in "Bdheader1", with: @title.bdheader1
    fill_in "Bdheader2", with: @title.bdheader2
    fill_in "Bheader1", with: @title.bheader1
    fill_in "Bheader2", with: @title.bheader2
    click_on "Create Title"

    assert_text "Title was successfully created"
    click_on "Back"
  end

  test "should update Title" do
    visit title_url(@title)
    click_on "Edit this title", match: :first

    fill_in "Bbutton", with: @title.bbutton
    fill_in "Bdheader1", with: @title.bdheader1
    fill_in "Bdheader2", with: @title.bdheader2
    fill_in "Bheader1", with: @title.bheader1
    fill_in "Bheader2", with: @title.bheader2
    click_on "Update Title"

    assert_text "Title was successfully updated"
    click_on "Back"
  end

  test "should destroy Title" do
    visit title_url(@title)
    click_on "Destroy this title", match: :first

    assert_text "Title was successfully destroyed"
  end
end

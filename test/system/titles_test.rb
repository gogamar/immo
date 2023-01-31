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

    fill_in "bbutton_ca", with: @title.bbutton_ca
    fill_in "bdheader1_ca", with: @title.bdheader1_ca
    fill_in "bdheader2_ca", with: @title.bdheader2_ca
    fill_in "bheader1_ca", with: @title.bheader1_ca
    fill_in "bheader2_ca", with: @title.bheader2_ca
    click_on "Create Title"

    assert_text "Title was successfully created"
    click_on "Back"
  end

  test "should update Title" do
    visit title_url(@title)
    click_on "Edit this title", match: :first

    fill_in "bbutton_ca", with: @title.bbutton_ca
    fill_in "bdheader1_ca", with: @title.bdheader1_ca
    fill_in "bdheader2_ca", with: @title.bdheader2_ca
    fill_in "bheader1_ca", with: @title.bheader1_ca
    fill_in "bheader2_ca", with: @title.bheader2_ca
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

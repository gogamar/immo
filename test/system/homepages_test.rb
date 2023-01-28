require "application_system_test_case"

class HomepagesTest < ApplicationSystemTestCase
  setup do
    @homepage = homepages(:one)
  end

  test "visiting the index" do
    visit homepages_url
    assert_selector "h1", text: "Homepages"
  end

  test "should create homepage" do
    visit homepages_url
    click_on "New homepage"

    fill_in "Bbutton", with: @homepage.bbutton
    fill_in "Bdheader1", with: @homepage.bdheader1
    fill_in "Bdheader2", with: @homepage.bdheader2
    fill_in "Bheader1", with: @homepage.bheader1
    fill_in "Bheader2", with: @homepage.bheader2
    click_on "Create Homepage"

    assert_text "Homepage was successfully created"
    click_on "Back"
  end

  test "should update Homepage" do
    visit homepage_url(@homepage)
    click_on "Edit this homepage", match: :first

    fill_in "Bbutton", with: @homepage.bbutton
    fill_in "Bdheader1", with: @homepage.bdheader1
    fill_in "Bdheader2", with: @homepage.bdheader2
    fill_in "Bheader1", with: @homepage.bheader1
    fill_in "Bheader2", with: @homepage.bheader2
    click_on "Update Homepage"

    assert_text "Homepage was successfully updated"
    click_on "Back"
  end

  test "should destroy Homepage" do
    visit homepage_url(@homepage)
    click_on "Destroy this homepage", match: :first

    assert_text "Homepage was successfully destroyed"
  end
end

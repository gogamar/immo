require "application_system_test_case"

class WebrealestatesTest < ApplicationSystemTestCase
  setup do
    @webrealestate = webrealestates(:one)
  end

  test "visiting the index" do
    visit webrealestates_url
    assert_selector "h1", text: "Webrealestates"
  end

  test "should create webrealestate" do
    visit webrealestates_url
    click_on "New webrealestate"

    fill_in "Address", with: @webrealestate.address
    fill_in "Bedrooms", with: @webrealestate.bedrooms
    fill_in "Email", with: @webrealestate.email
    check "Lift" if @webrealestate.lift
    fill_in "Operation", with: @webrealestate.operation
    fill_in "Owner", with: @webrealestate.owner
    fill_in "Phone", with: @webrealestate.phone
    fill_in "Price", with: @webrealestate.price
    fill_in "Status", with: @webrealestate.status
    fill_in "Surface", with: @webrealestate.surface
    check "Terrace" if @webrealestate.terrace
    fill_in "Type", with: @webrealestate.type
    click_on "Create Webrealestate"

    assert_text "Webrealestate was successfully created"
    click_on "Back"
  end

  test "should update Webrealestate" do
    visit webrealestate_url(@webrealestate)
    click_on "Edit this webrealestate", match: :first

    fill_in "Address", with: @webrealestate.address
    fill_in "Bedrooms", with: @webrealestate.bedrooms
    fill_in "Email", with: @webrealestate.email
    check "Lift" if @webrealestate.lift
    fill_in "Operation", with: @webrealestate.operation
    fill_in "Owner", with: @webrealestate.owner
    fill_in "Phone", with: @webrealestate.phone
    fill_in "Price", with: @webrealestate.price
    fill_in "Status", with: @webrealestate.status
    fill_in "Surface", with: @webrealestate.surface
    check "Terrace" if @webrealestate.terrace
    fill_in "Type", with: @webrealestate.type
    click_on "Update Webrealestate"

    assert_text "Webrealestate was successfully updated"
    click_on "Back"
  end

  test "should destroy Webrealestate" do
    visit webrealestate_url(@webrealestate)
    click_on "Destroy this webrealestate", match: :first

    assert_text "Webrealestate was successfully destroyed"
  end
end

require "application_system_test_case"

class RealestatesTest < ApplicationSystemTestCase
  setup do
    @realestate = realestates(:one)
  end

  test "visiting the index" do
    visit realestates_url
    assert_selector "h1", text: "Realestates"
  end

  test "should create realestate" do
    visit realestates_url
    click_on "New realestate"

    fill_in "Ad", with: @realestate.ad
    fill_in "Area", with: @realestate.area
    fill_in "Country", with: @realestate.country
    fill_in "Csurface", with: @realestate.csurface
    fill_in "Idagency", with: @realestate.idagency
    fill_in "Idfile", with: @realestate.idfile
    fill_in "Namestreet", with: @realestate.namestreet
    fill_in "Numberstreet", with: @realestate.numberstreet
    fill_in "Postcode", with: @realestate.postcode
    fill_in "Province", with: @realestate.province
    fill_in "Reference", with: @realestate.reference
    fill_in "Region", with: @realestate.region
    fill_in "Rentprice", with: @realestate.rentprice
    fill_in "Salesprice", with: @realestate.salesprice
    fill_in "Speclocation", with: @realestate.speclocation
    fill_in "Title", with: @realestate.title
    fill_in "Town", with: @realestate.town
    fill_in "Type", with: @realestate.rstype
    fill_in "Typestreet", with: @realestate.typestreet
    fill_in "Usurface", with: @realestate.usurface
    click_on "Create Realestate"

    assert_text "Realestate was successfully created"
    click_on "Back"
  end

  test "should update Realestate" do
    visit realestate_url(@realestate)
    click_on "Edit this realestate", match: :first

    fill_in "Ad", with: @realestate.ad
    fill_in "Area", with: @realestate.area
    fill_in "Country", with: @realestate.country
    fill_in "Csurface", with: @realestate.csurface
    fill_in "Idagency", with: @realestate.idagency
    fill_in "Idfile", with: @realestate.idfile
    fill_in "Namestreet", with: @realestate.namestreet
    fill_in "Numberstreet", with: @realestate.numberstreet
    fill_in "Postcode", with: @realestate.postcode
    fill_in "Province", with: @realestate.province
    fill_in "Reference", with: @realestate.reference
    fill_in "Region", with: @realestate.region
    fill_in "Rentprice", with: @realestate.rentprice
    fill_in "Salesprice", with: @realestate.salesprice
    fill_in "Speclocation", with: @realestate.speclocation
    fill_in "Title", with: @realestate.title
    fill_in "Town", with: @realestate.town
    fill_in "Type", with: @realestate.rstype
    fill_in "Typestreet", with: @realestate.typestreet
    fill_in "Usurface", with: @realestate.usurface
    click_on "Update Realestate"

    assert_text "Realestate was successfully updated"
    click_on "Back"
  end

  test "should destroy Realestate" do
    visit realestate_url(@realestate)
    click_on "Destroy this realestate", match: :first

    assert_text "Realestate was successfully destroyed"
  end
end

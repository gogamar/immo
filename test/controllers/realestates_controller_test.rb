require "test_helper"

class RealestatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @realestate = realestates(:one)
  end

  test "should get index" do
    get realestates_url
    assert_response :success
  end

  test "should get new" do
    get new_realestate_url
    assert_response :success
  end

  test "should create realestate" do
    assert_difference("Realestate.count") do
      post realestates_url, params: { realestate: { ad: @realestate.ad, area: @realestate.area, country: @realestate.country, csurface: @realestate.csurface, idagency: @realestate.idagency, idfile: @realestate.idfile, namestreet: @realestate.namestreet, numberstreet: @realestate.numberstreet, postcode: @realestate.postcode, province: @realestate.province, reference: @realestate.reference, region: @realestate.region, rentprice: @realestate.rentprice, salesprice: @realestate.salesprice, speclocation: @realestate.speclocation, title: @realestate.title, town: @realestate.town, type: @realestate.rstype, typestreet: @realestate.typestreet, usurface: @realestate.usurface } }
    end

    assert_redirected_to realestate_url(Realestate.last)
  end

  test "should show realestate" do
    get realestate_url(@realestate)
    assert_response :success
  end

  test "should get edit" do
    get edit_realestate_url(@realestate)
    assert_response :success
  end

  test "should update realestate" do
    patch realestate_url(@realestate), params: { realestate: { ad: @realestate.ad, area: @realestate.area, country: @realestate.country, csurface: @realestate.csurface, idagency: @realestate.idagency, idfile: @realestate.idfile, namestreet: @realestate.namestreet, numberstreet: @realestate.numberstreet, postcode: @realestate.postcode, province: @realestate.province, reference: @realestate.reference, region: @realestate.region, rentprice: @realestate.rentprice, salesprice: @realestate.salesprice, speclocation: @realestate.speclocation, title: @realestate.title, town: @realestate.town, type: @realestate.rstype, typestreet: @realestate.typestreet, usurface: @realestate.usurface } }
    assert_redirected_to realestate_url(@realestate)
  end

  test "should destroy realestate" do
    assert_difference("Realestate.count", -1) do
      delete realestate_url(@realestate)
    end

    assert_redirected_to realestates_url
  end
end

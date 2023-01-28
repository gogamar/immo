require "test_helper"

class WebrealestatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @webrealestate = webrealestates(:one)
  end

  test "should get index" do
    get webrealestates_url
    assert_response :success
  end

  test "should get new" do
    get new_webrealestate_url
    assert_response :success
  end

  test "should create webrealestate" do
    assert_difference("Webrealestate.count") do
      post webrealestates_url, params: { webrealestate: { address: @webrealestate.address, bedrooms: @webrealestate.bedrooms, email: @webrealestate.email, lift: @webrealestate.lift, operation: @webrealestate.operation, owner: @webrealestate.owner, phone: @webrealestate.phone, price: @webrealestate.price, status: @webrealestate.status, surface: @webrealestate.surface, terrace: @webrealestate.terrace, type: @webrealestate.type } }
    end

    assert_redirected_to webrealestate_url(Webrealestate.last)
  end

  test "should show webrealestate" do
    get webrealestate_url(@webrealestate)
    assert_response :success
  end

  test "should get edit" do
    get edit_webrealestate_url(@webrealestate)
    assert_response :success
  end

  test "should update webrealestate" do
    patch webrealestate_url(@webrealestate), params: { webrealestate: { address: @webrealestate.address, bedrooms: @webrealestate.bedrooms, email: @webrealestate.email, lift: @webrealestate.lift, operation: @webrealestate.operation, owner: @webrealestate.owner, phone: @webrealestate.phone, price: @webrealestate.price, status: @webrealestate.status, surface: @webrealestate.surface, terrace: @webrealestate.terrace, type: @webrealestate.type } }
    assert_redirected_to webrealestate_url(@webrealestate)
  end

  test "should destroy webrealestate" do
    assert_difference("Webrealestate.count", -1) do
      delete webrealestate_url(@webrealestate)
    end

    assert_redirected_to webrealestates_url
  end
end

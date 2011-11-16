require 'test_helper'

class RentPricesControllerTest < ActionController::TestCase
  setup do
    @rent_price = rent_prices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rent_prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rent_price" do
    assert_difference('RentPrice.count') do
      post :create, rent_price: @rent_price.attributes
    end

    assert_redirected_to rent_price_path(assigns(:rent_price))
  end

  test "should show rent_price" do
    get :show, id: @rent_price.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rent_price.to_param
    assert_response :success
  end

  test "should update rent_price" do
    put :update, id: @rent_price.to_param, rent_price: @rent_price.attributes
    assert_redirected_to rent_price_path(assigns(:rent_price))
  end

  test "should destroy rent_price" do
    assert_difference('RentPrice.count', -1) do
      delete :destroy, id: @rent_price.to_param
    end

    assert_redirected_to rent_prices_path
  end
end

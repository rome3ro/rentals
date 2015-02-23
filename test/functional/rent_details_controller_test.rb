require 'test_helper'

class RentDetailsControllerTest < ActionController::TestCase
  setup do
    @rent_detail = rent_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rent_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rent_detail" do
    assert_difference('RentDetail.count') do
      post :create, rent_detail: @rent_detail.attributes
    end

    assert_redirected_to rent_detail_path(assigns(:rent_detail))
  end

  test "should show rent_detail" do
    get :show, id: @rent_detail.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rent_detail.to_param
    assert_response :success
  end

  test "should update rent_detail" do
    put :update, id: @rent_detail.to_param, rent_detail: @rent_detail.attributes
    assert_redirected_to rent_detail_path(assigns(:rent_detail))
  end

  test "should destroy rent_detail" do
    assert_difference('RentDetail.count', -1) do
      delete :destroy, id: @rent_detail.to_param
    end

    assert_redirected_to rent_details_path
  end
end

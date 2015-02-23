require 'test_helper'

class DealDetailsControllerTest < ActionController::TestCase
  setup do
    @deal_detail = deal_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deal_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deal_detail" do
    assert_difference('DealDetail.count') do
      post :create, deal_detail: @deal_detail.attributes
    end

    assert_redirected_to deal_detail_path(assigns(:deal_detail))
  end

  test "should show deal_detail" do
    get :show, id: @deal_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deal_detail
    assert_response :success
  end

  test "should update deal_detail" do
    put :update, id: @deal_detail, deal_detail: @deal_detail.attributes
    assert_redirected_to deal_detail_path(assigns(:deal_detail))
  end

  test "should destroy deal_detail" do
    assert_difference('DealDetail.count', -1) do
      delete :destroy, id: @deal_detail
    end

    assert_redirected_to deal_details_path
  end
end

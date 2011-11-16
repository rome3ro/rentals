require 'test_helper'

class MovieKindsControllerTest < ActionController::TestCase
  setup do
    @movie_kind = movie_kinds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movie_kinds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie_kind" do
    assert_difference('MovieKind.count') do
      post :create, movie_kind: @movie_kind.attributes
    end

    assert_redirected_to movie_kind_path(assigns(:movie_kind))
  end

  test "should show movie_kind" do
    get :show, id: @movie_kind.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movie_kind.to_param
    assert_response :success
  end

  test "should update movie_kind" do
    put :update, id: @movie_kind.to_param, movie_kind: @movie_kind.attributes
    assert_redirected_to movie_kind_path(assigns(:movie_kind))
  end

  test "should destroy movie_kind" do
    assert_difference('MovieKind.count', -1) do
      delete :destroy, id: @movie_kind.to_param
    end

    assert_redirected_to movie_kinds_path
  end
end

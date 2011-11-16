require 'test_helper'

class MovieFormatsControllerTest < ActionController::TestCase
  setup do
    @movie_format = movie_formats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movie_formats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie_format" do
    assert_difference('MovieFormat.count') do
      post :create, movie_format: @movie_format.attributes
    end

    assert_redirected_to movie_format_path(assigns(:movie_format))
  end

  test "should show movie_format" do
    get :show, id: @movie_format.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movie_format.to_param
    assert_response :success
  end

  test "should update movie_format" do
    put :update, id: @movie_format.to_param, movie_format: @movie_format.attributes
    assert_redirected_to movie_format_path(assigns(:movie_format))
  end

  test "should destroy movie_format" do
    assert_difference('MovieFormat.count', -1) do
      delete :destroy, id: @movie_format.to_param
    end

    assert_redirected_to movie_formats_path
  end
end

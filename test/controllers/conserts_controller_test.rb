require 'test_helper'

class ConsertsControllerTest < ActionController::TestCase
  setup do
    @consert = conserts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conserts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consert" do
    assert_difference('Consert.count') do
      post :create, consert: { city: @consert.city, country: @consert.country, date: @consert.date, name: @consert.name, place: @consert.place, state: @consert.state }
    end

    assert_redirected_to consert_path(assigns(:consert))
  end

  test "should show consert" do
    get :show, id: @consert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consert
    assert_response :success
  end

  test "should update consert" do
    patch :update, id: @consert, consert: { city: @consert.city, country: @consert.country, date: @consert.date, name: @consert.name, place: @consert.place, state: @consert.state }
    assert_redirected_to consert_path(assigns(:consert))
  end

  test "should destroy consert" do
    assert_difference('Consert.count', -1) do
      delete :destroy, id: @consert
    end

    assert_redirected_to conserts_path
  end
end

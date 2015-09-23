require 'test_helper'

class UserCatalogsControllerTest < ActionController::TestCase
  setup do
    @user_catalog = user_catalogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_catalogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_catalog" do
    assert_difference('UserCatalog.count') do
      post :create, user_catalog: { age: @user_catalog.age, email: @user_catalog.email, favoritebook: @user_catalog.favoritebook, firstname: @user_catalog.firstname, lastname: @user_catalog.lastname, username: @user_catalog.username }
    end

    assert_redirected_to user_catalog_path(assigns(:user_catalog))
  end

  test "should show user_catalog" do
    get :show, id: @user_catalog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_catalog
    assert_response :success
  end

  test "should update user_catalog" do
    patch :update, id: @user_catalog, user_catalog: { age: @user_catalog.age, email: @user_catalog.email, favoritebook: @user_catalog.favoritebook, firstname: @user_catalog.firstname, lastname: @user_catalog.lastname, username: @user_catalog.username }
    assert_redirected_to user_catalog_path(assigns(:user_catalog))
  end

  test "should destroy user_catalog" do
    assert_difference('UserCatalog.count', -1) do
      delete :destroy, id: @user_catalog
    end

    assert_redirected_to user_catalogs_path
  end
end

require 'test_helper'

class BookcodesControllerTest < ActionController::TestCase
  setup do
    @bookcode = bookcodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookcodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bookcode" do
    assert_difference('Bookcode.count') do
      post :create, bookcode: { code: @bookcode.code, filename: @bookcode.filename, format: @bookcode.format, page_offset: @bookcode.page_offset, title: @bookcode.title }
    end

    assert_redirected_to bookcode_path(assigns(:bookcode))
  end

  test "should show bookcode" do
    get :show, id: @bookcode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bookcode
    assert_response :success
  end

  test "should update bookcode" do
    patch :update, id: @bookcode, bookcode: { code: @bookcode.code, filename: @bookcode.filename, format: @bookcode.format, page_offset: @bookcode.page_offset, title: @bookcode.title }
    assert_redirected_to bookcode_path(assigns(:bookcode))
  end

  test "should destroy bookcode" do
    assert_difference('Bookcode.count', -1) do
      delete :destroy, id: @bookcode
    end

    assert_redirected_to bookcodes_path
  end
end

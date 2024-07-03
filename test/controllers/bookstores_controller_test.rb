require "test_helper"

class BookstoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bookstores_index_url
    assert_response :success
  end

  test "should get show" do
    get bookstores_show_url
    assert_response :success
  end

  test "should get new" do
    get bookstores_new_url
    assert_response :success
  end

  test "should get create" do
    get bookstores_create_url
    assert_response :success
  end

  test "should get edit" do
    get bookstores_edit_url
    assert_response :success
  end

  test "should get update" do
    get bookstores_update_url
    assert_response :success
  end

  test "should get destroy" do
    get bookstores_destroy_url
    assert_response :success
  end
end

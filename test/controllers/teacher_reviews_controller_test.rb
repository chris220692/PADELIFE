require 'test_helper'

class TeacherReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teacher_reviews_index_url
    assert_response :success
  end

  test "should get show" do
    get teacher_reviews_show_url
    assert_response :success
  end

  test "should get new" do
    get teacher_reviews_new_url
    assert_response :success
  end

  test "should get create" do
    get teacher_reviews_create_url
    assert_response :success
  end

  test "should get edit" do
    get teacher_reviews_edit_url
    assert_response :success
  end

  test "should get update" do
    get teacher_reviews_update_url
    assert_response :success
  end

  test "should get destroy" do
    get teacher_reviews_destroy_url
    assert_response :success
  end

end

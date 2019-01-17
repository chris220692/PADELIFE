require 'test_helper'

class ClubReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get club_reviews_index_url
    assert_response :success
  end

  test "should get show" do
    get club_reviews_show_url
    assert_response :success
  end

  test "should get new" do
    get club_reviews_new_url
    assert_response :success
  end

  test "should get create" do
    get club_reviews_create_url
    assert_response :success
  end

  test "should get edit" do
    get club_reviews_edit_url
    assert_response :success
  end

  test "should get update" do
    get club_reviews_update_url
    assert_response :success
  end

  test "should get destroy" do
    get club_reviews_destroy_url
    assert_response :success
  end

end

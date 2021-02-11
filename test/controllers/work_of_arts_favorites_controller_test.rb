require 'test_helper'

class WorkOfArtsFavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get work_of_arts_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get work_of_arts_favorites_destroy_url
    assert_response :success
  end

end

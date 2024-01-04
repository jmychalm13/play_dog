require "test_helper"

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/friendships.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Friendship.count, data.length
  end
end

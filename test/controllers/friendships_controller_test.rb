require "test_helper"

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/friendships.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Friendship.count, data.length
  end

  test "create" do
    assert_difference "Friendship.count", 1 do
      post "/friendships.json", params: {
        user_id: User.first.id,
        friend_id: Friend.first.id,
        status: false
      }
      assert_response 200
    end
  end
end

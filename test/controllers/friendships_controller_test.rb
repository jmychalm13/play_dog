require "test_helper"

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(
      name: "Tiger",
      email: "tiger@fake.com",
      password: "password",
      password_confirmation: "password",
      image_url: "test.jpg"
    )
    @user2 = User.create(
      name: "Mary Jane",
      email: "mj420@fake.com",
      password: "password",
      password_confirmation: "password",
      image_url: "test.jpg"
    )
    post "/sessions.json", params: {
      email: "tiger@fake.com",
      password: "password"
    }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
    @friendship = Friendship.create(user_id: @user.id, friend_id: @user2.id, status: false)
  end

  test "index" do
    get "/friendships.json", headers: {
      "Authorization" => "Bearer #{@jwt}"
    }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Friendship.count, data.length
  end

  test "create" do
    assert_difference "Friendship.count", 1 do
      post "/friendships.json",
      params: {
        user_id: @user.id,
        friend_id: @user2.id
      },
      headers: {
        "Authorization" => "Bearer #{@jwt}"
      }
      assert_response 200
    end
  end

  test "show" do
    get "/friendships/#{Friendship.first.id}.json", headers: {
      "Authorization" => "Bearer #{@jwt}"
    }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "friend_id", "status"], data.keys
  end

  test "update" do
    patch "/friendships/#{@friendship.id}.json", params: {
      status: "true"
    },
    headers: {
      "Authorization" => "Bearer #{@jwt}"
    }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal true, data["status"]
  end

  test "destroy" do
    assert_difference "Friendship.count", -1 do
      delete "/friendships/#{Friendship.first.id}.json", headers: {
        "Authorization" => "Bearer #{@jwt}"
      }
      assert_response 200
    end
  end
end

require "test_helper"

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(
      name: "Tiger",
      email: "tiger@fake.com",
      password: "password",
      password_confirmation: "password"
    )
    @user2 = User.create(
      name: "Mary Jane",
      email: "mj420@fake.com",
      password: "password",
      password_confirmation: "password"
    )
    post "/sessions.json", params: {
      email: "tiger@fake.com",
      password: "password"
    }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/friendships.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Friendship.count, data.length
  end

  test "create" do
    pp @jwt
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
end

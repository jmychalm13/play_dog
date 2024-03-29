require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(
      email: "test@fake.com",
      password: "password",
      password_confirmation: "password",
      name: "Testy McTesterson",
      image_url: "test.jpg"
    )
    post "/sessions.json", params: {
      email: "test@fake.com",
      password: "password"
    }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/users.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal User.count, data.length
  end

  test "create" do
    assert_difference "User.count", 1 do
      post "/users.json", params: {
        name: "Jane",
        email: "jane@test.com",
        image_url: "test.jpg",
        password: "password",
        password_confirmation: "password"
      }
      assert_response 201
    end
  end

  test "show" do
    get "/users/#{User.first.id}.json", headers: {
      "Authorization" => "Bearer #{@jwt}"
    }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "email", "dogs", "image_url", "friendships"], data.keys
  end

  test "update" do
    patch "/users/#{@user.id}.json", headers: {
      "Authorization" => "Bearer #{@jwt}"
    }, 
    params: {
      email: "updated email"
    }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "updated email", data["email"]
  end
end

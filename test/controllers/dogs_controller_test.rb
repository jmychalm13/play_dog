require "test_helper"

class DogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(
      name: "Dan",
      email: "dan@test.com",
      image_url: "test.jpg",
      password: "password",
      password_confirmation: "password"
    )
    post "/sessions.json", params: {
      email: "dan@test.com",
      password: "password"
    }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]

    @dog = Dog.create(
      name: "test",
      breed: "test",
      age: "test",
      user_id: @user.id,
      image_url: "test",
    )
  end

  test "index" do
    get "/dogs.json", headers: {
      "Authorization" => "Bearer #{@jwt}"
    }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Dog.where(user_id: @user.id).count, data.length
  end

  test "create" do
    assert_difference "Dog.count", 1 do
      post "/dogs.json", params: {
        name: "Test",
        user_id: User.first.id,
        age: 1,
        breed: "test",
        image_url: "test.jpg"
      },
      headers: {
        "Authorization" => "Bearer #{@jwt}"
      }
      assert_response 200
    end
  end

  test "show" do
    get "/dogs/#{@dog.id}.json", headers: {
      "Authorization" => "Bearer #{@jwt}"
    }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "name", "breed", "age", "image_url", "behaviors"], data.keys
  end

  test "update" do
    patch "/dogs/#{Dog.first.id}.json", params: {
      name: "updated name"
    },
    headers: {
      "Authorization" => "Bearer #{@jwt}"
    }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Dog.count", -1 do
      delete "/dogs/#{Dog.first.id}.json", headers: {
        "Authorization" => "Bearer #{@jwt}"
      }
      assert_response 200
    end
  end
end

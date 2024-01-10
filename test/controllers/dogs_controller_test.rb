require "test_helper"

class DogsControllerTest < ActionDispatch::IntegrationTest

  test "index" do
    get "/dogs.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Dog.count, data.length
  end

  test "create" do
    assert_difference "Dog.count", 1 do
      post "/dogs.json", params: {
        name: "Test",
        user_id: User.first.id,
        age: 1,
        breed: "test"
      }
      assert_response 200
    end
  end

  test "show" do
    get "/dogs/#{Dog.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "name", "breed", "age"], data.keys
  end

  test "update" do
    patch "/dogs/#{Dog.first.id}.json", params: {
      name: "updated name"
    }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Dog.count", -1 do
      delete "/dogs/#{Dog.first.id}.json"
      assert_response 200
    end
  end
end

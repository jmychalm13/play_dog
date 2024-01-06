require "test_helper"

class DogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(
      email: "testEmail@fake.com",
      password: "password",
      password_confirmation: "password",
      name: "Testy McTesterson"
    )
    @dog = Dog.create(
      name: "Test",
      age: 1,
      breed: "test",
      user_id: @user.id
    )    
  end

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
        user_id: @user.id,
        age: 1,
        breed: "test"
      }
      assert_response 200
    end
  end

  test "show" do
    get "/dogs/#{@dog.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "name", "breed", "age"], data.keys
  end

  test "update" do
    dog = Dog.first
    patch "/dogs/#{dog.id}.json", params: {
      name: "updated name"
    }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "updated name", data[:name]
  end

  test "destroy" do
    assert_difference "Dog.count", -1 do
      delete "/dogs/#{@dog.id}.json"
      assert_response 200
    end
  end
end

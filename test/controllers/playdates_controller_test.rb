require "test_helper"

class PlaydatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(
      email: "test@fake.com",
      password: "password",
      password_confirmation: "password",
      name: "Testy McTesterson",
      image_url: "test.jpg"

    )
    Dog.create(
      name: "Testy",
      breed: "test breed",
      age: 3,
      user_id: @user.id
    )
    User.create(
      email: "fake@fake.com",
      password: "password",
      password_confirmation: "password",
      name: "Test Name",
      image_url: "test.jpg"
    )
  end

  test "index" do
    get "/playdates.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Playdate.count, data.length
  end

  test "create" do
    assert_difference "Playdate.count", 1 do
      post "/playdates.json", params: {
        location: "park",
        time: "2024-01-02 13:45:30",
        user_id: User.first.id,
        dog_id: Dog.first.id,
      } 
    end
  end

  test "update" do
    patch "/playdates/#{Playdate.first.id}.json", params: {
      location: "updated location"
    }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "updated location", data["location"]
  end

  test "show" do
    get "/playdates/#{Playdate.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "location", "time", "user_id"], data.keys
  end

  test "destroy" do
    assert_difference "Playdate.count", -1 do
      delete "/playdates/#{Playdate.first.id}.json"
      assert_response 200
    end
  end
end

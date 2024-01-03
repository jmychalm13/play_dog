require "test_helper"

class PlaydatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(
      email: "test@fake.com",
      password: "password",
      password_confirmation: "password",
      name: "Testy McTesterson"
    )
    @playdate = Playdate.create(
      location: "test park",
      time: "2024-01-02 13:45:30",
      user_id: User.first,
      dog_id: Dog.first,
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
    patch "/playdates/#{@playdate.id}.json", params: {
      location: "updated location"
    }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "updated location", data["location"]
  end
end

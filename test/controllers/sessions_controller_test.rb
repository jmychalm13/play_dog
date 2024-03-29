require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    post "/users.json", params: {
      name: "Test",
      email: "test@fake.com",
      password: "password",
      password_confirmation: "password",
      image_url: "test.jpg"
    }
    post "/sessions.json", params: {
      email: "test@fake.com",
      password: "password"
    }

    assert_response 201

    data = JSON.parse(response.body)
    assert_equal ["jwt", "email", "user_id"], data.keys
  end
end

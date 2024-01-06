require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(
      email: "jess@fake.com",
      password: "password",
      password_confirmation: "password",
      name: "JMo"
    )
    @playdate = Playdate.create(
      location: "a place",
      time: "2024-01-02 13:45:30",
      user_id: @user.id
    )
  end

  test "index" do
    get "/comments.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Comment.count, data.length
  end

  test "create" do
    assert_difference "Comment.count", 1 do
      post "/comments.json", params: {
        content: "I am a test comment.",
        user_id: User.first.id,
        playdate_id: Playdate.first.id
      }
    end
  end

  test "show" do
    get "/comments/#{Comment.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "content", "user_id", "playdate_id"], data.keys
  end

  test "update" do
    patch "/comments/#{Comment.first.id}.json", params: {
      content: "updated content"
    }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "updated content", data[:content]
  end

  test "destroy" do
    assert_difference "Comment.count", -1 do
      delete "/comments/#{Comment.first.id}.json"
      assert_response 200
    end
  end
end

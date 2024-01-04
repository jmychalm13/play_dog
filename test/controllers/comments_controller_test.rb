require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/comments.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Comment.count, data.length
  end
end

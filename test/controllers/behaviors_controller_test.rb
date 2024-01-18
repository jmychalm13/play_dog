require "test_helper"

class BehaviorsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/behaviors.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ::Behavior.count, data.length
  end

  test "create" do
    assert_difference "::Behavior.count", 1 do
      post "/behaviors.json", params: {
        dog_id: Dog.first.id,
        behavior: "testy"
      }
      assert_response 200
    end
  end

  test "show" do
    get "/behaviors/#{::Behavior.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "dog_id", "behavior"], data.keys
  end

  test "update" do
    patch "/behaviors/#{::Behavior.first.id}.json", params: {
      behavior: "updated"
    }
    assert_response 200
    
    data = JSON.parse(response.body)
    assert_equal "updated", data["behavior"]
  end

  test "destroy" do
    assert_difference "::Behavior.count", -1 do
      delete "/behaviors/#{::Behavior.first.id}.json"
      assert_response 200
    end
  end
end

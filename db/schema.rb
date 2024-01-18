ActiveRecord::Schema[7.0].define(version: 2024_01_18_213618) do
  enable_extension "plpgsql"

  create_table "behaviors", force: :cascade do |t|
    t.integer "dog_id"
    t.string "behavior"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "playdate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.integer "age"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playdate_dogs", force: :cascade do |t|
    t.integer "dog_id"
    t.integer "playdate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playdates", force: :cascade do |t|
    t.string "location"
    t.datetime "time"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "image_url"
  end

end

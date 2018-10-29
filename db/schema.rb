# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_29_063126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.bigint "chatroom_id"
    t.string "name"
    t.datetime "activity_date"
    t.text "content"
    t.boolean "anonymous"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_activities_on_chatroom_id"
  end

  create_table "activity_comments", force: :cascade do |t|
    t.bigint "activity_id"
    t.string "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_activity_comments_on_activity_id"
    t.index ["user_id"], name: "index_activity_comments_on_user_id"
  end

  create_table "activity_participants", force: :cascade do |t|
    t.bigint "activity_id"
    t.boolean "is_join"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_activity_participants_on_activity_id"
    t.index ["user_id"], name: "index_activity_participants_on_user_id"
  end

  create_table "chatroom_groups", force: :cascade do |t|
    t.bigint "chatroom_id"
    t.bigint "user_id"
    t.boolean "is_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_notify", default: true
    t.boolean "float_top", default: false
    t.index ["chatroom_id"], name: "index_chatroom_groups_on_chatroom_id"
    t.index ["user_id"], name: "index_chatroom_groups_on_user_id"
  end

  create_table "chatroom_messages", force: :cascade do |t|
    t.bigint "chatroom_id"
    t.integer "message_type"
    t.text "content"
    t.integer "child"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_chatroom_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_chatroom_messages_on_user_id"
  end

  create_table "chatroom_note_comments", force: :cascade do |t|
    t.bigint "chatroom_note_id"
    t.string "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_note_id"], name: "index_chatroom_note_comments_on_chatroom_note_id"
    t.index ["user_id"], name: "index_chatroom_note_comments_on_user_id"
  end

  create_table "chatroom_notes", force: :cascade do |t|
    t.bigint "chatroom_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["chatroom_id"], name: "index_chatroom_notes_on_chatroom_id"
    t.index ["user_id"], name: "index_chatroom_notes_on_user_id"
  end

  create_table "chatroom_photos", force: :cascade do |t|
    t.bigint "chatroom_id"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_chatroom_photos_on_chatroom_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.boolean "is_group", default: false
    t.string "name"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "news_feed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["news_feed_id"], name: "index_favorites_on_news_feed_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "follower_apply_forms", force: :cascade do |t|
    t.bigint "follower_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id"], name: "index_follower_apply_forms_on_follower_id"
    t.index ["user_id"], name: "index_follower_apply_forms_on_user_id"
  end

  create_table "followers", force: :cascade do |t|
    t.bigint "follower_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id"], name: "index_followers_on_follower_id"
    t.index ["user_id"], name: "index_followers_on_user_id"
  end

  create_table "friend_apply_forms", force: :cascade do |t|
    t.bigint "apply_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apply_id"], name: "index_friend_apply_forms_on_apply_id"
    t.index ["user_id"], name: "index_friend_apply_forms_on_user_id"
  end

  create_table "friends", force: :cascade do |t|
    t.bigint "friend_id"
    t.bigint "user_id"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friends_on_friend_id"
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "news_feed_comments", force: :cascade do |t|
    t.bigint "news_feed_id"
    t.string "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["news_feed_id"], name: "index_news_feed_comments_on_news_feed_id"
    t.index ["user_id"], name: "index_news_feed_comments_on_user_id"
  end

  create_table "news_feed_likes", force: :cascade do |t|
    t.bigint "news_feed_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["news_feed_id"], name: "index_news_feed_likes_on_news_feed_id"
    t.index ["user_id"], name: "index_news_feed_likes_on_user_id"
  end

  create_table "news_feed_photos", force: :cascade do |t|
    t.bigint "news_feed_id"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["news_feed_id"], name: "index_news_feed_photos_on_news_feed_id"
  end

  create_table "news_feeds", force: :cascade do |t|
    t.text "description", null: false
    t.float "lat"
    t.float "lng"
    t.bigint "user_id"
    t.boolean "is_private", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["user_id"], name: "index_news_feeds_on_user_id"
  end

  create_table "scenic_spot_photos", force: :cascade do |t|
    t.bigint "scenic_spot_id"
    t.string "path"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scenic_spot_id"], name: "index_scenic_spot_photos_on_scenic_spot_id"
  end

  create_table "scenic_spots", force: :cascade do |t|
    t.string "name"
    t.text "description_detail"
    t.string "description"
    t.string "phone"
    t.string "address"
    t.string "open_time"
    t.float "lat"
    t.float "lng"
    t.string "city"
    t.text "travel_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "phone"
    t.string "avatar"
    t.integer "gender", default: 3
    t.text "description"
    t.integer "device_type"
    t.string "device_token"
    t.boolean "is_public", default: true
    t.string "identifier"
    t.string "authentication_token"
    t.datetime "authentication_token_time"
    t.string "refresh_token"
    t.datetime "refresh_token_time"
    t.time "notification_start_at"
    t.time "notification_end_at"
    t.string "canned_message"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["identifier"], name: "index_users_on_identifier", unique: true
    t.index ["refresh_token"], name: "index_users_on_refresh_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "chatrooms"
  add_foreign_key "activity_comments", "activities"
  add_foreign_key "activity_comments", "users"
  add_foreign_key "activity_participants", "activities"
  add_foreign_key "activity_participants", "users"
  add_foreign_key "chatroom_groups", "chatrooms"
  add_foreign_key "chatroom_groups", "users"
  add_foreign_key "chatroom_messages", "chatrooms"
  add_foreign_key "chatroom_messages", "users"
  add_foreign_key "chatroom_note_comments", "chatroom_notes"
  add_foreign_key "chatroom_note_comments", "users"
  add_foreign_key "chatroom_notes", "chatrooms"
  add_foreign_key "chatroom_notes", "users"
  add_foreign_key "chatroom_photos", "chatrooms"
  add_foreign_key "favorites", "news_feeds"
  add_foreign_key "favorites", "users"
  add_foreign_key "follower_apply_forms", "users"
  add_foreign_key "follower_apply_forms", "users", column: "follower_id"
  add_foreign_key "followers", "users"
  add_foreign_key "followers", "users", column: "follower_id"
  add_foreign_key "friend_apply_forms", "users"
  add_foreign_key "friend_apply_forms", "users", column: "apply_id"
  add_foreign_key "friends", "users"
  add_foreign_key "friends", "users", column: "friend_id"
  add_foreign_key "news_feed_comments", "news_feeds"
  add_foreign_key "news_feed_comments", "users"
  add_foreign_key "news_feed_likes", "news_feeds"
  add_foreign_key "news_feed_likes", "users"
  add_foreign_key "news_feed_photos", "news_feeds"
  add_foreign_key "news_feeds", "users"
  add_foreign_key "scenic_spot_photos", "scenic_spots"
end

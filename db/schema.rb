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

ActiveRecord::Schema.define(version: 2018_05_04_150100) do

  create_table "activities", force: :cascade do |t|
    t.integer "chatroom_id"
    t.string "name"
    t.datetime "activity_date"
    t.text "content"
    t.boolean "anonymous"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_activities_on_chatroom_id"
  end

  create_table "activity_comments", force: :cascade do |t|
    t.integer "activity_id"
    t.string "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_activity_comments_on_activity_id"
    t.index ["user_id"], name: "index_activity_comments_on_user_id"
  end

  create_table "activity_participants", force: :cascade do |t|
    t.integer "activity_id"
    t.boolean "is_join"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_activity_participants_on_activity_id"
    t.index ["user_id"], name: "index_activity_participants_on_user_id"
  end

  create_table "attraction_comments", force: :cascade do |t|
    t.integer "attraction_id"
    t.boolean "is_join"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_attraction_comments_on_attraction_id"
    t.index ["user_id"], name: "index_attraction_comments_on_user_id"
  end

  create_table "attraction_likes", force: :cascade do |t|
    t.integer "attraction_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_attraction_likes_on_attraction_id"
    t.index ["user_id"], name: "index_attraction_likes_on_user_id"
  end

  create_table "attraction_pictures", force: :cascade do |t|
    t.integer "attraction_id"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_attraction_pictures_on_attraction_id"
  end

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "lat"
    t.decimal "lng"
    t.integer "user_id"
    t.boolean "is_private"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_attractions_on_user_id"
  end

  create_table "chat_groups", force: :cascade do |t|
    t.integer "chatroom_id"
    t.integer "user_id"
    t.boolean "is_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_chat_groups_on_chatroom_id"
    t.index ["user_id"], name: "index_chat_groups_on_user_id"
  end

  create_table "chat_messages", force: :cascade do |t|
    t.integer "chatroom_id"
    t.integer "type"
    t.text "content"
    t.integer "child_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_chat_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_chat_messages_on_user_id"
  end

  create_table "chatroom_albums", force: :cascade do |t|
    t.integer "chatroom_id"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_chatroom_albums_on_chatroom_id"
  end

  create_table "chatroom_note_comments", force: :cascade do |t|
    t.integer "chatroom_note_id"
    t.string "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_note_id"], name: "index_chatroom_note_comments_on_chatroom_note_id"
    t.index ["user_id"], name: "index_chatroom_note_comments_on_user_id"
  end

  create_table "chatroom_notes", force: :cascade do |t|
    t.integer "chatroom_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_chatroom_notes_on_chatroom_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.boolean "is_group"
    t.string "name"
    t.string "picture"
    t.boolean "is_notify"
    t.boolean "float_top"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "attraction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_favorites_on_attraction_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "follower_apply_forms", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id"], name: "index_follower_apply_forms_on_follower_id"
    t.index ["user_id"], name: "index_follower_apply_forms_on_user_id"
  end

  create_table "followers", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id"], name: "index_followers_on_follower_id"
    t.index ["user_id"], name: "index_followers_on_user_id"
  end

  create_table "friend_apply_forms", force: :cascade do |t|
    t.integer "apply_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apply_id"], name: "index_friend_apply_forms_on_apply_id"
    t.index ["user_id"], name: "index_friend_apply_forms_on_user_id"
  end

  create_table "friends", force: :cascade do |t|
    t.integer "friend_id"
    t.integer "user_id"
    t.string "nick_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friends_on_friend_id"
    t.index ["user_id"], name: "index_friends_on_user_id"
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
    t.string "nick_name"
    t.string "phone"
    t.string "avatar"
    t.integer "gender", default: 3
    t.text "description"
    t.string "key"
    t.integer "device_type"
    t.string "device_token"
    t.boolean "is_public"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

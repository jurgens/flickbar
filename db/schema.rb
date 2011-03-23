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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110323212851) do

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authorizations", ["user_id"], :name => "index_authorizations_on_user_id"

  create_table "friendships", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "friend_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["friend_id"], :name => "index_friendships_on_friend_id"
  add_index "friendships", ["user_id"], :name => "index_friendships_on_user_id"

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imdb_id"
    t.string   "director"
    t.string   "poster_file_name"
    t.decimal  "rating",           :precision => 3, :scale => 1
    t.date     "release_date"
    t.boolean  "imdb_not_found",                                 :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.string   "email"
  end

  add_index "users", ["nickname"], :name => "index_users_on_nickname", :unique => true

  create_table "watches", :force => true do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "watched",    :default => false
  end

  add_index "watches", ["movie_id"], :name => "index_watches_on_movie_id"
  add_index "watches", ["user_id"], :name => "index_watches_on_user_id"

end

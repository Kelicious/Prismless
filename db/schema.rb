# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130623224554) do

  create_table "adminships", :force => true do |t|
    t.integer  "community_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "adminships", ["community_id"], :name => "index_adminships_on_community_id"
  add_index "adminships", ["user_id"], :name => "index_adminships_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "community_id"
    t.string   "slug"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "categories", ["community_id"], :name => "index_categories_on_community_id"
  add_index "categories", ["slug"], :name => "index_categories_on_slug", :unique => true

  create_table "communities", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "privacy"
    t.string   "password_digest"
  end

  add_index "communities", ["slug"], :name => "index_communities_on_slug", :unique => true

  create_table "favorites", :force => true do |t|
    t.integer  "community_id"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "favorites", ["community_id", "user_id"], :name => "index_favorites_on_community_id_and_user_id", :unique => true
  add_index "favorites", ["community_id"], :name => "index_favorites_on_community_id"
  add_index "favorites", ["user_id"], :name => "index_favorites_on_user_id"

  create_table "forums", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "category_id"
    t.string   "description"
  end

  add_index "forums", ["category_id"], :name => "index_forums_on_category_id"

  create_table "memberships", :force => true do |t|
    t.integer  "community_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["community_id"], :name => "index_memberships_on_community_id"
  add_index "memberships", ["user_id"], :name => "index_memberships_on_user_id"

  create_table "posts", :force => true do |t|
    t.integer  "topic_id"
    t.integer  "author_id"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "posts", ["author_id"], :name => "index_posts_on_author_id"
  add_index "posts", ["topic_id"], :name => "index_posts_on_topic_id"

  create_table "topics", :force => true do |t|
    t.integer  "forum_id"
    t.integer  "creator_id"
    t.string   "title"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.datetime "last_post_at"
    t.boolean  "pinned",       :default => false, :null => false
  end

  add_index "topics", ["creator_id"], :name => "index_topics_on_creator_id"
  add_index "topics", ["forum_id"], :name => "index_topics_on_forum_id"
  add_index "topics", ["last_post_at"], :name => "index_topics_on_last_post_at"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "views", :force => true do |t|
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.string   "viewable_type"
    t.integer  "count",         :default => 0, :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "views", ["user_id"], :name => "index_views_on_user_id"
  add_index "views", ["viewable_id"], :name => "index_views_on_viewable_id"

  create_table "votes", :force => true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["post_id", "user_id"], :name => "index_votes_on_post_id_and_user_id", :unique => true
  add_index "votes", ["post_id"], :name => "index_votes_on_post_id"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

end

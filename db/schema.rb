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

ActiveRecord::Schema.define(:version => 20110419042841) do

  create_table "authorized_users", :force => true do |t|
    t.string   "username"
    t.string   "password_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "post_id",      :null => false
    t.string   "author",       :null => false
    t.string   "author_url",   :null => false
    t.string   "author_email", :null => false
    t.text     "body",         :null => false
    t.text     "body_html",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
  end

  add_index "comments", ["created_at"], :name => "index_comments_on_created_at"
  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"

  create_table "images", :force => true do |t|
    t.string   "title"
    t.integer  "image_file_size"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mail_creds", :force => true do |t|
    t.string   "user_name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "slug",       :null => false
    t.text     "body",       :null => false
    t.text     "body_html",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["created_at"], :name => "index_pages_on_created_at"
  add_index "pages", ["title"], :name => "index_pages_on_title"

  create_table "posts", :force => true do |t|
    t.string   "title",                                     :null => false
    t.string   "slug",                                      :null => false
    t.text     "body",                                      :null => false
    t.text     "body_html",                                 :null => false
    t.boolean  "active",                  :default => true, :null => false
    t.integer  "approved_comments_count", :default => 0,    :null => false
    t.string   "cached_tag_list"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "edited_at",                                 :null => false
  end

  add_index "posts", ["published_at"], :name => "index_posts_on_published_at"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string  "name"
    t.integer "taggings_count", :default => 0, :null => false
  end

  add_index "tags", ["name"], :name => "index_tags_on_name"

  create_table "undo_items", :force => true do |t|
    t.string   "type",       :null => false
    t.datetime "created_at", :null => false
    t.text     "data"
  end

  add_index "undo_items", ["created_at"], :name => "index_undo_items_on_created_at"

  create_table "works", :force => true do |t|
    t.string   "title"
    t.boolean  "featured"
    t.text     "explanation_html"
    t.text     "responsibilities_html"
    t.integer  "sort_number"
    t.integer  "featuredview_file_size"
    t.string   "featuredview_file_name"
    t.string   "featuredview_content_type"
    t.datetime "featuredview_updated_at"
    t.string   "fullsizeview_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "featured_sort"
    t.integer  "first_file_size"
    t.string   "first_file_name"
    t.string   "first_content_type"
    t.datetime "first_updated_at"
    t.integer  "second_file_size"
    t.string   "second_file_name"
    t.string   "second_content_type"
    t.datetime "second_updated_at"
    t.integer  "third_file_size"
    t.string   "third_file_name"
    t.string   "third_content_type"
    t.datetime "third_updated_at"
    t.integer  "fourth_file_size"
    t.string   "fourth_file_name"
    t.string   "fourth_content_type"
    t.datetime "fourth_updated_at"
    t.integer  "fifth_file_size"
    t.string   "fifth_file_name"
    t.string   "fifth_content_type"
    t.datetime "fifth_updated_at"
  end

end

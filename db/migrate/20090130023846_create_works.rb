class CreateWorks < ActiveRecord::Migration
  def self.up
    create_table :works do |t|

      t.string   "title"
      t.boolean  "featured"

      t.text     "explanation_html"
      t.text     "responsibilities_html"

      t.string   "category"
      t.integer  "sort_number"

      t.integer  "featuredview_file_size"
      t.string   "featuredview_file_name"
      t.string   "featuredview_content_type"
      t.datetime "featuredview_updated_at"

      t.integer  "largeview_file_size"
      t.string   "largeview_file_name"
      t.string   "largeview_content_type"
      t.datetime "largeview_updated_at"

      t.integer  "fullsizeview_file_size"
      t.string   "fullsizeview_file_name"
      t.string   "fullsizeview_content_type"
      t.datetime "fullsizeview_updated_at"

      t.string   "fullsizeview_url"

      t.timestamps
    end
  end

  def self.down
    drop_table :works
  end
end

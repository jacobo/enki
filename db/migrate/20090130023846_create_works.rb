class CreateWorks < ActiveRecord::Migration
  def self.up
    create_table :works do |t|
      
      t.string   "title"
      t.text     "body_html"
      t.string   "category"
      t.integer  "sort_number"
      
      t.integer  "preview_file_size"
      t.string   "preview_file_name"
      t.string   "preview_content_type"
      t.datetime "preview_updated_at"

      t.integer  "largeview_file_size"
      t.string   "largeview_file_name"
      t.string   "largeview_content_type"
      t.datetime "largeview_updated_at"
      
      t.string   "largeview_url"
      

      t.timestamps
    end
  end

  def self.down
    drop_table :works
  end
end

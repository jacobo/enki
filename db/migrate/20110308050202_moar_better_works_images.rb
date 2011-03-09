class MoarBetterWorksImages < ActiveRecord::Migration
  def self.up
    remove_column :works, :largeview_file_size
    remove_column :works, :largeview_file_name
    remove_column :works, :largeview_content_type
    remove_column :works, :largeview_updated_at
    remove_column :works, :fullsizeview_file_size
    remove_column :works, :fullsizeview_file_name
    remove_column :works, :fullsizeview_content_type
    remove_column :works, :fullsizeview_updated_at

    add_column :works, :first_file_size, :integer
    add_column :works, :first_file_name, :string
    add_column :works, :first_content_type, :string
    add_column :works, :first_updated_at, :datetime
    add_column :works, :second_file_size, :integer
    add_column :works, :second_file_name, :string
    add_column :works, :second_content_type, :string
    add_column :works, :second_updated_at, :datetime
    add_column :works, :third_file_size, :integer
    add_column :works, :third_file_name, :string
    add_column :works, :third_content_type, :string
    add_column :works, :third_updated_at, :datetime
    add_column :works, :fourth_file_size, :integer
    add_column :works, :fourth_file_name, :string
    add_column :works, :fourth_content_type, :string
    add_column :works, :fourth_updated_at, :datetime
    add_column :works, :fifth_file_size, :integer
    add_column :works, :fifth_file_name, :string
    add_column :works, :fifth_content_type, :string
    add_column :works, :fifth_updated_at, :datetime
  end

  def self.down
    add_column :works, :largeview_file_size, :integer
    add_column :works, :largeview_file_name, :string
    add_column :works, :largeview_content_type, :string
    add_column :works, :largeview_updated_at, :datetime
    add_column :works, :fullsizeview_file_size, :integer
    add_column :works, :fullsizeview_file_name, :string
    add_column :works, :fullsizeview_content_type, :string
    add_column :works, :fullsizeview_updated_at, :datetime

    remove_column :works, :first_file_size
    remove_column :works, :first_file_name
    remove_column :works, :first_content_type
    remove_column :works, :first_updated_at
    remove_column :works, :second_file_size
    remove_column :works, :second_file_name
    remove_column :works, :second_content_type
    remove_column :works, :second_updated_at
    remove_column :works, :third_file_size
    remove_column :works, :third_file_name
    remove_column :works, :third_content_type
    remove_column :works, :third_updated_at
    remove_column :works, :fourth_file_size
    remove_column :works, :fourth_file_name
    remove_column :works, :fourth_content_type
    remove_column :works, :fourth_updated_at
    remove_column :works, :fifth_file_size
    remove_column :works, :fifth_file_name
    remove_column :works, :fifth_content_type
    remove_column :works, :fifth_updated_at
  end
end

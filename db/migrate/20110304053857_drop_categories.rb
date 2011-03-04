class DropCategories < ActiveRecord::Migration
  def self.up
    remove_column :works, :category
  end

  def self.down
    add_column :works, :category, :string
  end
end

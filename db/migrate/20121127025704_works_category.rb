class WorksCategory < ActiveRecord::Migration
  def self.up
    add_column :works, "category", :string
  end

  def self.down
    remove_column :works, "category"
  end
end

class FeaturedSorting < ActiveRecord::Migration
  def self.up
    add_column :works, :featured_sort, :integer
  end

  def self.down
    remove_column :works, :featured_sort
  end
end

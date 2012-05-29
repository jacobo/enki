class Moremoreworksimages < ActiveRecord::Migration
  def self.up
    moar_countings.each do |counthing|
      add_column :works, "#{counthing}_file_size", :integer
      add_column :works, "#{counthing}_file_name", :string
      add_column :works, "#{counthing}_content_type", :string
      add_column :works, "#{counthing}_updated_at", :datetime
    end
  end

  def self.down
    moar_countings.each do |counthing|
      remove_column :works, "#{counthing}_file_size"
      remove_column :works, "#{counthing}_file_name"
      remove_column :works, "#{counthing}_content_type"
      remove_column :works, "#{counthing}_updated_at"
    end
  end

  def self.moar_countings
    [:sixth, :seventh, :eigth, :ninth, :tenth, :eleventh, :twelth, :thirteenth, :fourteenth, :fifteenth]
  end
end

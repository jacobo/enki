class Work < ActiveRecord::Base
  has_attached_file :featuredview, :styles => { :preview => "200x86", :display => "399x171" }
  has_attached_file :largeview, :styles => { :preview => "278x141", :display => "556x282" }
  has_attached_file :fullsizeview, :styles => { :preview => "300x300>" }

  def next
    Work.find(:first, :conditions => ["sort_number > ?", self.sort_number], :order => "sort_number ASC")
  end

  def previous
    Work.find(:first, :conditions => ["sort_number < ?", self.sort_number], :order => "sort_number DESC")
  end

  def self.featured
    Work.find(:all, :conditions => ["featured = ?", true], :order => "featured_sort")
  end

  def self.all_in_category(category)
    Work.find(:all, :conditions => ["category = ?", category], :order => "sort_number")
  end

  def self.all_categories
    @@all_categories ||= Work.find(:all).collect{ |w| w.category }.uniq
  end

  def anchor_in_category
    Work.all_in_category(self.category).index(self) + 1
  end

end

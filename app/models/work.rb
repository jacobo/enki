class Work < ActiveRecord::Base
  has_attached_file :featuredview
  # , :styles => { :preview => "200x86", :display => "399x171" }
  has_attached_file :largeview
  # , :styles => { :preview => "278x141", :display => "556x282" }
  has_attached_file :fullsizeview
  # , :styles => { :preview => "300x300>" }

  # default_scope :order => 'sort_number ASC'

  def next
    Work.find(:first, :conditions => ["sort_number > ?", self.sort_number], :order => "sort_number ASC")
  end

  def previous
    Work.find(:first, :conditions => ["sort_number < ?", self.sort_number], :order => "sort_number DESC")
  end

  def self.featured
    Work.find(:all, :conditions => ["featured = ?", true], :order => "featured_sort ASC")
  end

end

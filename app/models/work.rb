class Work < ActiveRecord::Base
  has_attached_file :featuredview

  has_attached_file :first
  has_attached_file :second
  has_attached_file :third
  has_attached_file :fourth
  has_attached_file :fifth
  
  def self.attached_file_names
    [:first, :second, :third, :fourth, :fifth]
  end
  # default_scope :order => 'sort_number ASC'

  def work_images
    Work.attached_file_names.collect do |image_name|
      self.send image_name
    end
  end

  def next
    Work.find(:first, :conditions => ["sort_number > ?", self.sort_number], :order => "sort_number ASC")
  end

  def previous
    Work.find(:first, :conditions => ["sort_number < ?", self.sort_number], :order => "sort_number DESC")
  end

  def self.featured
    Work.find(:all, :conditions => ["featured = ?", true], :order => "featured_sort ASC")
  end

  def self.first
    Work.find(:first, :order => "sort_number ASC")
  end

end

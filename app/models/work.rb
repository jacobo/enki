class Work < ActiveRecord::Base
  has_attached_file :featuredview

  def self.attached_file_names
    [:first, :second, :third, :fourth, :fifth, :sixth, :seventh, :eigth, :ninth, :tenth, :eleventh, :twelth, :thirteenth, :fourteenth, :fifteenth]
  end
  attached_file_names.each do |attached_file_name|
    has_attached_file attached_file_name
  end

  # default_scope :order => 'sort_number ASC'

  def work_images
    @work_images ||= Work.attached_file_names.collect do |image_name|
      self.send image_name
    end.select(&:exists?)
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

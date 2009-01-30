class Work < ActiveRecord::Base
  has_attached_file :preview, :styles => { :medium => "300x300>" }
  has_attached_file :largeview, :styles => { :medium => "300x300>" }
  
end

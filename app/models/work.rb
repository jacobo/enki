class Work < ActiveRecord::Base
  has_attached_file :featuredview, :styles => { :preview => "200x86", :display => "400x172" }
  has_attached_file :largeview, :styles => { :preview => "278x141", :display => "556x282" }
  has_attached_file :fullsizeview, :styles => { :preview => "300x300>" }
  
end

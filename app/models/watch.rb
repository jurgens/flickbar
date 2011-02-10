class Watch < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :movie

  default_scope order("created_at DESC")

end

class Watch < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :movie

  validates :movie_id, :presence => true
  validates :user_id, :presence => true

  default_scope order("created_at DESC")

end

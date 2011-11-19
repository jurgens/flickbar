class Comment < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validates :body, :presence => true
  validates :user_id, :presence => true
  validates :movie_id, :presence => true

end

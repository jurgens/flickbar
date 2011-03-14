class Watch < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :movie

  validates :movie_id, :presence => true
  validates :user_id, :presence => true

  default_scope order("created_at DESC")

  validate :recently_watched

protected

  def recently_watched
    if self.class.where(:user_id => user_id).where(:movie_id => movie_id).where("created_at >= ?", 7.days.ago).count > 0
      errors[:base] << 'You have already added this movie to your list'
    end
  end
end

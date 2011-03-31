class Watch < ActiveRecord::Base

  belongs_to :user
  belongs_to :movie

  validates :movie_id, :presence => true
  validates :user_id, :presence => true

  delegate :title, :to => :movie, :prefix => 'movie'

  default_scope order("created_at DESC")

  scope :recently,  lambda { where("created_at >= ?", 7.days.ago) }
  scope :same_as,   lambda { |o| where(:user_id => o.user_id, :movie_id => o.movie_id) }

  validate :recently_watched

protected

  def recently_watched
    if Watch.same_as(self).recently.any?
      errors[:base] << 'You have already added this movie to your list'
    end
  end
  
end

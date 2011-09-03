class Watch < ActiveRecord::Base

  belongs_to :user
  belongs_to :movie

  has_many :events

  validates :movie_id, :presence => true
  validates :user_id, :presence => true

  delegate :title, :to => :movie, :prefix => 'movie'

  default_scope order("created_at DESC")

#  before_create :default_status

  scope :recently,  lambda { where("created_at >= ?", 7.days.ago) }
  scope :same_as,   lambda { |o| where(:user_id => o.user_id).where(:movie_id => o.movie_id).where("id <> ?", o.id.to_i) }
  scope :by_status, lambda { |status| where(:status => status) unless status.blank? }

  validate :recently_watched

  def poster_url(kind)
    movie.poster.url kind if movie.poster
  end

  state_machine :status, :initial => :wish do
    after_transition any => :watched, :do => :set_watched_at
    after_transition any => :wish, :do => :unset_watched_at

    event :watch do
      transition :wish => :watched
    end

    event :wish do
      transition any => :wish
    end
  end

protected

  def set_watched_at
    update_attribute :watched_at, Time.now
  end

  def unset_watched_at
    update_attribute :watched_at, nil
  end

  def recently_watched
    if Watch.same_as(self).recently.any?
      errors[:base] << 'You have already added this movie to your list'
    end
  end

end

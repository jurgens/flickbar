class Event < ActiveRecord::Base
  TYPES = %w{wish watch}

  belongs_to :user
  belongs_to :movie

  validates :user_id, :presence => true
  validates :movie_id, :presence => true

  default_scope order("created_at DESC")

  def self.very_last
    self.unscoped.order("id DESC").limit(1).first
  end

  def poster_url(kind)
    movie.poster.url(kind) if movie.present? && movie.poster.present?
  end

end

class Movie < ActiveRecord::Base
  has_many :watches
  has_many :users, :through => :watches

  validates :title, :presence => true

  scope :recently_watched, lambda { joins(:watches).select("DISTINCT movies.*").order("watches.created_at DESC").limit(25)}

  def self.find_or_create(title)
    find_by_title(title) || create(:title => title.titleize)
  end
end

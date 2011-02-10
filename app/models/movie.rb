class Movie < ActiveRecord::Base
  has_many :watches
  has_many :users, :through => :watches

  def self.find_or_create(title)
    find_by_title(title) || create(:title => title.titleize)
  end
end

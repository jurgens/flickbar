class User < ActiveRecord::Base
  has_many :authorizations
  has_many :watches
  
  devise :omniauthable

  scope :recent, order("created_at DESC").limit(25)

  attr_accessible :name, :nickname

  def self.create_from_hash!(hash)
    nick = hash['user_info']['nickname']
    if nick.match /^profile\.php.+/
      nick = hash['user_info']['name'].split(' ').map(&:downcase).join('.')
    end
    create(:name => hash['user_info']['name'], :nickname => nick)
  end
end

class User < ActiveRecord::Base
  has_many :authorizations
  has_many :watches
  
  devise :omniauthable

  attr_accessible :name, :nickname

  def self.create_from_hash!(hash)
    create(:name => hash['user_info']['name'], :nickname => hash['user_info']['nickname'])
  end
end

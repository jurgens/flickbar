class User < ActiveRecord::Base
  has_many :authorizations
  devise :omniauthable

  def self.create_from_hash!(hash)
    create(:name => hash['user_info']['name'], :nickname => hash['user_info']['nickname'])
  end
end

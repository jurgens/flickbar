class User < ActiveRecord::Base

  has_many :authorizations, :dependent  => :destroy
  has_many :watches,        :dependent  => :destroy
  has_many :movies,         :through    => :watches
  has_many :friendships,    :dependent  => :destroy
  has_many :friends,        :through    => :friendships, :class_name => 'User'

  devise :omniauthable, :rememberable

  attr_accessible :name, :nickname, :email, :password, :password_confirmation, :remember_me

  scope :recent, order("created_at DESC").limit(25)

#  def self.create_from_hash!(hash)
#    nick = hash['user_info']['nickname']
#
#    if nick.match /^profile\.php.+/
#      nick = hash['user_info']['name'].split(' ').map(&:downcase).join('.')
#    end
#
#    create!( :name => hash['user_info']['name'], :nickname => nick, :email => hash['user_info']['email'], :remember_me => true )
#  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    # name, nickname, email, first_name, last_name, image
    data = access_token['user_info']
    if user = User.find_by_email(data["email"])
      user
    else # Create an user
      nick = data['nickname']
      if nick.match /^profile\.php.+/
        nick = data['name'].split(' ').map(&:downcase).join('.')
      end
      # TODO: add avatar
      User.create!(:name => data['name'], :nickname => nick, :email => data["email"], :remember_me => true ) #, :password => Devise.friendly_token[0,20]
    end
  end

  def friendship_with(user)
    self.friendships.find_by_friend_id user.id
  end

  def remember_me
    true
  end

#  def friend_watches
#    user_ids = self.friend_ids
#  end
end

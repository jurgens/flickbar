class User < ActiveRecord::Base

  has_many :authorizations, :dependent  => :destroy
  has_many :watches,        :dependent  => :destroy
  has_many :movies,         :through    => :watches
  has_many :friendships,    :dependent  => :destroy
  has_many :friends,        :through    => :friendships, :class_name => 'User'

  devise :omniauthable, :rememberable

  attr_accessible :name, :nickname, :email, :password, :password_confirmation, :remember_me

  scope :recent, order("created_at DESC").limit(25)

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    # name, nickname, email, first_name, last_name, image
    data = access_token['user_info']
    user = User.find_by_email(data["email"])

    if user.nil? # Create an user
      nick = data['nickname']
      if nick.match /^profile\.php.+/
        nick = data['name'].split(' ').map(&:downcase).join('.')
      end
      # TODO: add avatar
      user = User.create!(:name => data['name'], :nickname => nick, :email => data["email"], :remember_me => true ) #, :password => Devise.friendly_token[0,20]
    end

    user
  end

  def to_param
    nickname
  end

  def friends_with?(user)
    self.friends.include? user
  end

  def remember_me
    true
  end

  def news(limit)
    Watch.where(:user_id => self.friend_ids).limit(limit)
  end

  def events
    Event.where(:user_id => self.friend_ids)
  end

  def wishlist
    watches.with_status(:wish).includes(:movie).order('created_at DESC')
  end

  def watchedlist
    watches.with_status(:watched).includes(:movie).order('watched_at DESC')
  end
end

class User < ApplicationRecord
  has_many :categories
  has_many :costs
  has_many :incomes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0,20]
  #     # user.name = auth.info.name   # assuming the user model has a name
  #     # user.avatar = auth.info.image # assuming the user model has an image
  #   end
  # end

  def self.from_omniauth(auth)
    cur_user = User.where(email: auth.info.email).first
    if cur_user
      cur_user.update(provider: auth.provider, uid: auth.uid)
      cur_user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        # user.name = auth.info.name   # assuming the user model has a name
        # user.avatar = auth.info.image # assuming the user model has an image
      end
    end
  end

end

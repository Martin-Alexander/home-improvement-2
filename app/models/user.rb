class User < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise(
    :database_authenticatable,
    :registerable,
    :rememberable,
    :validatable,
    :omniauthable,
    omniauth_providers: [:facebook]
  )

  validates_presence_of :name

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0, 20]
    end
  end
end

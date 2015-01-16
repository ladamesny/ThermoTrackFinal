class User < ActiveRecord::Base

  after_create :set_email_list

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:google_oauth2]
  include Gravtastic
  gravtastic
  has_many :houses, dependent: :destroy

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(email: data["email"]).first

    unless user
      user = User.create(name: data["name"], email: data["email"], password: Devise.friendly_token[0,20], image: data["image"])
      EmailList.create(name: user.name, email: user.email)
      
    end
    user
  end

  def set_email_list
    EmailList.create(name: self.name, email: self.email, creator_id: self.id)
  end
end
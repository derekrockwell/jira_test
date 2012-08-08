class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  :provider, :uid, :name, :access_token
  # attr_accessible :title, :body

  has_many :user_workouts
  has_many :workouts, through: :user_workouts, source: :workout

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  	user = User.where(:provider => auth.provider, :uid => auth.uid).first
  	unless user
  		user = User.create!(name:auth.extra.raw_info.name,
  			provider:auth.provider,
  			uid:auth.uid,
  			email:auth.info.email,
        access_token:auth.credentials.token,
  			password:Devise.friendly_token[0,20]
  			)
  	end
  	user
  end
  
end

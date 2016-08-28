class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username, :name, :firstname, :email, :dayofbirth
  validates_uniqueness_of :username, :email


#bdd links
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy


#uploader carrierwave
  # mount_uploader :avatar, AvatarUploader



end

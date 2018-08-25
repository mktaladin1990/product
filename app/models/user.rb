class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_secure_password
  mount_uploader :avatar, AvatarUploader

  def admin?
    self.role == "admin"
  end
  # def login?
  #
  # end
  # end
end

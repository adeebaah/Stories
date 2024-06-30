class User < ApplicationRecord
  has_many :blogs, dependent: :destroy
  has_one_attached :avatar
  has_one :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

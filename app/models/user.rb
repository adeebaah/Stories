class User < ApplicationRecord
  has_many :blogs, dependent: :destroy
  has_one_attached :avatar
  has_one :profile

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Override Devise's update method to skip password if not provided
  def update_without_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end
end

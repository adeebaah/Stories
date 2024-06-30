class Blog < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  paginates_per 6
  validates :title, presence: true
  validates :content, presence: true
end

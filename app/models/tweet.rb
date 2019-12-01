class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many_attached :images

  validates :text, presence: true
end

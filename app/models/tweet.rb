class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many_attached :images

  validates :text, presence: true
end

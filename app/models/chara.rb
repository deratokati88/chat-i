class Chara < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name, :image, presence: true
  belongs_to :user
  has_many :rooms
  has_many :chara_messages
  has_many :message_contents
end

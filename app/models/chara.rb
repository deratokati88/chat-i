class Chara < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  validates :name,:image, presence: true
  has_many :rooms
  has_many :chara_messages
  has_one :message_content
end

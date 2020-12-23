class Chara < ApplicationRecord
  validates :name,:image, presence: true
  has_many :rooms
  has_many :chara_messages
end

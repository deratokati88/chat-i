class Chara < ApplicationRecord
  validates :name,:image, presence: true
  has_many :rooms
end

class Chara < ApplicationRecord
  validates :name,:image, presence: true
end

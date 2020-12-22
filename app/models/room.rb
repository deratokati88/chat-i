class Room < ApplicationRecord
  validates :name, :favo, :user_id, :chara_id, presence: true
end

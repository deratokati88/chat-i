class Room < ApplicationRecord
  validates :name, :favo, :user_id, :chara_id, presence: true
  belongs_to :user
  belongs_to :chara
  has_one :chara_message
  has_many :messages, dependent: :destroy
end

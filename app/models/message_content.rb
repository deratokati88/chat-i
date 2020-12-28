class MessageContent < ApplicationRecord
  belongs_to :chara
  has_one :chara_message

  validates :content,:feeling_id, :favo, :chara_id, presence: true
  validates :feeling_id, :favo, numericality: { only_integer: true }
end

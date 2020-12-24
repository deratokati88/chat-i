class MessageContent < ApplicationRecord
  belongs_to :chara
  has_one :chara_message

  validates :content,:feeling_id, :favo, presence: true
end

class CharaMessage < ApplicationRecord
  has_one :room
  belongs_to :chara
  has_one :message
  has_one :message_content

  validates :content, :feeling_id, presence: true
end

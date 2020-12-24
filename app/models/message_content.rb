class MessageContent < ApplicationRecord
  belongs_to :chara
  has_one :chara_message
end

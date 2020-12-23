class CharaMessage < ApplicationRecord
  has_one :room
  belongs_to :chara
  has_one :message

  validates :content,:feeling_id, presence: true

end

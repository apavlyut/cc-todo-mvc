class Todo < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :text, uniqueness: true, presence: true
  scope :completed, -> {where completed: true}
  scope :active, -> {where completed: false}

  before_create do
    self.text = text.mb_chars.capitalize
  end
end

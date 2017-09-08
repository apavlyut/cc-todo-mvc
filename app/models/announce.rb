class Announce < ApplicationRecord
  validates :title, :message, presence: true
  has_many :announce_users
  has_many :users, through: :announce_users
end

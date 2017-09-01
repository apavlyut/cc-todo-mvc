class User < ApplicationRecord
  has_secure_password
  has_many :todos, dependent: :destroy

  enum role: [:user, :admin]
end

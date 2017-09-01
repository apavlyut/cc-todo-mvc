class Comment < ApplicationRecord
  belongs_to :todo

  belongs_to :author, class_name: 'User'

  validates :text, presence: true
end

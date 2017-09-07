class Comment < ApplicationRecord
  belongs_to :todo

  belongs_to :author, class_name: 'User'

  validates :text, presence: true

  def notify_todo_owner
    puts "connecting to mail server ..."
    sleep 3
    TodoMailer.comment_added(self).deliver_now
    puts "connected!"
    puts "delivered!"
  end
end

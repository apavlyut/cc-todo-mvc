class Comment < ApplicationRecord
  belongs_to :todo

  belongs_to :author, class_name: 'User'

  validates :text, presence: true

  def notify_todo_owner
    puts "tring to send ..."
    # sleep 3
    if todo.user.send_email?
      puts "sending email"
      TodoMailer.comment_added(self).deliver_now
    end
    if todo.user.send_sms? && todo.user.phone.present?
      puts "sending sms notify to user"
      sms = SMSC.new()
      ret = sms.send_sms(ENV['SMS_PHONE'], "Вам написали камент")
    end
    puts "connected!"
    puts "delivered!"
  end
end

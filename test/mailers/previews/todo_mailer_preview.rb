# Preview all emails at http://localhost:3000/rails/mailers/todo_mailer
class TodoMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/todo_mailer/comment_added
  def comment_added
    TodoMailer.comment_added(Comment.last)
  end

end

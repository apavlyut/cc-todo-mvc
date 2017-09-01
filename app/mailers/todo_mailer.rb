class TodoMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.todo_mailer.comment_added.subject
  #
  def comment_added(comment)
    @comment = comment

    mail to: comment.todo.user.email, subject: 'Добавлен комментарий'
  end
end

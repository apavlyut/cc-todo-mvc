class TodoJob < ApplicationJob
  queue_as :default

  def perform(comment_id)
    comment = Comment.find_by id: comment_id
    if comment
      puts "coment exist"
      comment.notify_todo_owner
    else
      puts "comment not exist"
    end
  end
end

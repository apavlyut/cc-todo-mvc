json.extract! comment, :id, :todo_id, :text, :author_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)

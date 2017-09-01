json.extract! todo, :id, :text, :completed, :created_at, :updated_at, :demo
json.url todo_url(todo, format: :json)

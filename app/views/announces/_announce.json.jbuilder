json.extract! announce, :id, :title, :message, :created_at, :updated_at
json.url announce_url(announce, format: :json)

json.extract! chat, :id, :user_id, :message, :room_id, :image, :created_at, :updated_at
json.url chat_url(chat, format: :json)

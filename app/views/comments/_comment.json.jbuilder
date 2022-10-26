json.extract! comment, :id, :board_id, :message, :user_id, :integer, :image, :created_at, :updated_at
json.url comment_url(comment, format: :json)

json.extract! board, :id, :group_id, :icon, :message, :image, :user_id, :created_at, :updated_at
json.url board_url(board, format: :json)

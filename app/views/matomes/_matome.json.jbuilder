json.extract! matome, :id, :title, :description, :like, :user_id, :created_at, :updated_at
json.url matome_url(matome, format: :json)

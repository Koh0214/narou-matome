json.extract! matome, :id, :title, :discription, :like, :created_at, :updated_at
json.url matome_url(matome, format: :json)

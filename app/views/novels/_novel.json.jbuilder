json.extract! novel, :id, :title, :discription, :review, :url, :amazon_url, :matome_id, :created_at, :updated_at
json.url novel_url(novel, format: :json)

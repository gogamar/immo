json.extract! image, :id, :name, :url, :realestate_id, :created_at, :updated_at
json.url image_url(image, format: :json)

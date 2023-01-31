json.extract! post, :id, :title_ca, :author, :content, :created_at, :updated_at
json.url post_url(post, format: :json)

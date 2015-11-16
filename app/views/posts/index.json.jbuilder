json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :proce, :neighborhood, :external_url, :timestamp
  json.url post_url(post, format: :json)
end

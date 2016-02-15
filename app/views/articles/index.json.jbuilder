json.array!(@articles) do |article|
  json.extract! article, :id, :title, :author, :image_url, :published_date, :subtitle, :body, :category, :user_id
  json.url article_url(article, format: :json)
end

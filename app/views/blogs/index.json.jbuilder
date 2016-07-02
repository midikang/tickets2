json.array!(@blogs) do |blog|
  json.extract! blog, :id, :title, :view_count
  json.url blog_url(blog, format: :json)
end

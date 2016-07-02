json.array!(@blog_contents) do |blog_content|
  json.extract! blog_content, :id, :content, :blog_id
  json.url blog_content_url(blog_content, format: :json)
end

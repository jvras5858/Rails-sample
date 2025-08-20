class PostSerializer
  include JSONAPI::Serializer
  set_type :post
  attributes :title, :content, :created_at, :updated_at

  attribute :file_url do |post|
    Rails.application.routes.url_helpers.url_for(post.file) if post.file.attached?
  end
end

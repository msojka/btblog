class Comment < ActiveResource::Base
  self.include_format_in_path = false
  self.include_root_in_json = true
  self.site = "https://peaceful-depths-00196.herokuapp.com/posts/:post_id"

  validates :name, presence: true
  validates :body, presence: true
end

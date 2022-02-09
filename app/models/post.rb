class Post < ActiveResource::Base
  self.include_format_in_path = false
  self.include_root_in_json = true
  self.site = "http://localhost:4000"

  has_many :comments

  validates :title, presence: true
  validates :body, presence: true
end

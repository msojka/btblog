class Post < ActiveResource::Base
  self.include_format_in_path = false
  self.include_root_in_json = true
  self.site = "https://peaceful-depths-00196.herokuapp.com/"

  has_many :comments

  validates :title, presence: true
  validates :body, presence: true
end

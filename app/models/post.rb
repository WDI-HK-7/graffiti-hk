class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :comments
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100X100>"}
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end

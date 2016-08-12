class Post < ActiveRecord::Base
  has_many :comments
  validates_presence_of :title, presence: true
  validates_presence_of :body, presence: true
end

class Post < ActiveRecord::Base
  validates_presence_of :title, presence: true
  validates_presence_of :body, presence: true
end

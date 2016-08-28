class Post < ActiveRecord::Base
  has_many :comments, foreign_key: :user_id,  dependent: :destroy
  belongs_to :user
  validates_presence_of :title, presence: true
  validates_presence_of :body, presence: true
end

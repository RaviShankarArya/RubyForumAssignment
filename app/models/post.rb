class Post < ActiveRecord::Base
  belongs_to :forum
  belongs_to :user
  has_many :comments
  validates :name, :content, :presence => true
end

class Comment < ApplicationRecord
  belongs_to :question
  belongs_to :customer
  has_many :likes
  has_many :liking_users, :through => :likes, :source => :customer
end

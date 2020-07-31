class Comment < ApplicationRecord

  ##校验
  validates :content, presence: true

  ##关联
  belongs_to :user
  belongs_to :post
end

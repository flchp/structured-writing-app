class Like < ApplicationRecord

  ##关联
  belongs_to :user
  belongs_to :post
end

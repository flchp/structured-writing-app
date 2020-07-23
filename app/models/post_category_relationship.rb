class PostCategoryRelationship < ApplicationRecord
  ##关联
  belongs_to :category
  belongs_to :post
end

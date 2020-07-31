class Category < ApplicationRecord
  ##校验
  validates :name, presence: true

  ##关联
  belongs_to :user
  #post和category的多对多关联
  has_many :post_category_relationships
  has_many :posts, :through => :post_category_relationships
end

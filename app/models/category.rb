class Category < ApplicationRecord
  ##校验
  validates :name, presence: true

  ##关联
  belongs_to :user
end

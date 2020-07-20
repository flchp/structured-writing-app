class Post < ApplicationRecord

  ##校验
  validates :title, presence: true

  ##关联
  belongs_to :user

end

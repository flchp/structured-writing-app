class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ##关联
  has_many :posts, :dependent => :destroy
  has_many :categories
  has_many :comments
  #用户收藏文章的多对多关联
  has_many :likes
  has_many :liked_posts, :through => :likes, :source => :post



end

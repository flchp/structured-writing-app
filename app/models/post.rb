class Post < ApplicationRecord

  ##校验
  validates :title, presence: true

  ##关联
  belongs_to :user

  has_many :comments
  #文章模版自连接结构
  has_many :children_posts, class_name: 'Post',
           foreign_key: 'post_model_id'
  belongs_to :post_model, class_name: 'Post',
             optional: true
  #post和category的多对多关联
  has_many :post_category_relationships
  has_many :categories, :through => :post_category_relationships
  #用户收藏文章的多对多关联
  has_many :likes, :dependent => :destroy
  has_many :liked_users, :through => :likes, source:  :user

  ##scope方法
  scope :is_private, -> {where(set_is_private: true)}
  scope :is_public, -> {where(set_is_private: false)}

  scope :is_model, -> {where(set_is_model: true)}
  scope :is_not_model, -> {where(set_is_model: false)}

  ##回调
  # 使用模版写文章新增回调
  before_save :add_post_content, on: :create

  ##公有方法
  def find_like(user)
    self.likes.where( :user_id => user.id ).first
  end

  ##私有方法
  private

  def add_post_content
    self.content = self.post_model.content if (self.post_model && !self.content)
  end

end

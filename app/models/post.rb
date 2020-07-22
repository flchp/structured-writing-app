class Post < ApplicationRecord

  ##校验
  validates :title, presence: true

  ##关联
  belongs_to :user
  #文章模版自连接结构
  has_many :children_posts, class_name: 'Post',
           foreign_key: 'post_model_id'
  belongs_to :post_model, class_name: 'Post',
             optional: true

  ##scope方法
  scope :is_private, -> {where(set_is_private: true)}
  scope :is_public, -> {where(set_is_private: false)}

  scope :is_model, -> {where(set_is_model: true)}
  scope :is_not_model, -> {where(set_is_model: false)}

  ##回调
  # 使用模版写文章新增回调
  before_save :add_post_content, on: :create

  ##私有方法
  private

  def add_post_content
    self.content = self.post_model.content if (self.post_model && !self.content)
  end

end

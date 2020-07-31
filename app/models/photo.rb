class Photo < ApplicationRecord

  ##校验
  validates :user_id, presence: true
  validates :image, presence: true
  ##上传插件
  mount_uploader :image, PhotoUploader

end

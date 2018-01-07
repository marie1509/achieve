class Vlog < ApplicationRecord
      validates :title,:content, presence: true
      validates :title,:content, length: { in: 1..140 }

      belongs_to :user ,optional: true
      has_many :favorites, dependent: :destroy
      #そのブログをお気に入り登録した人を取得するメソッドを定義
      has_many :favorite_users, through: :favorites, source: :user

      mount_uploader :image, ImageUploader
end

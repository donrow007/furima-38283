class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # テーブルとのアソシエーション
  belongs_to :user
  

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :item_condition
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_day

  # active_storageとのアソシエーション
  has_one_attached :image

  
    
    validates :image, presence: true
    validates :name, presence: true 
    validates :description, presence: true 
    validates :price, presence: true 
  
    # 数値は半角数値
    validates :price, format: { with: /\A[0-9]+\z/ }
    # 整数のみを許可
    validates :price, numericality: { only_integer: true }
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999  }

  

  # ジャンルの選択が「--」の時は保存不可
    validates :category_id, numericality: { other_than: 0 }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :item_condition_id, numericality: { other_than: 0 }
    validates :shipping_cost_id, numericality: { other_than: 0 }
    validates :shipping_day_id, numericality: { other_than: 0 }
end
  

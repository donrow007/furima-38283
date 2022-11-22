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

  

  
    validates :user_id, presence: true 
    validates :name, presence: true 
    validates :description, presence: true 
    validates :category_id, presence: true 
    validates :item_condition_id, presence: true 
    validates :shipping_cost_id, presence: true 
    validates :prefecture_id, presence: true 
    validates :shipping_day_id, presence: true 
    # 300円以上かつ半角数字でないと入力不可
    validates :price, numericality: { greater_than_or_equal_to: 300 }
  

  # ジャンルの選択が「--」の時は保存不可
    validates :category_id, numericality: { other_than: 0 }
    validates :delivery_area_id, numericality: { other_than: 0 }
    validates :item_status_id, numericality: { other_than: 0 }
    validates :shipping_cost_id, numericality: { other_than: 0 }
    validates :shipping_date_id, numericality: { other_than: 0 }

  
end
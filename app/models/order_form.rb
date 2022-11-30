class OrderForm
  include ActiveModel::Model
  
  attr_accessor :user, :item, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :order

  with_options presence: true do
    # orderモデルのバリデーション
    validates :user
    validates :item
    # destinationモデルのバリデーション
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :building_name
    validates :phone_number, format: { with: /\A[0-9]+{11}\z/, message: 'テストコード後に実装！' }
    validates :order
  end

  def save
    order = Order.create(user: user, item: item)
    # ストロングパラメーター
    Payment.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_numberorder, order: order )
  end
end
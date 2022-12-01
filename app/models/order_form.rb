class OrderForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :order

  with_options presence: true do
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # destinationモデルのバリデーション
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
  # トークンのバリデーション
    validates :token
  end

  def save
    order = Order.create(user: user_id, item: item_id)
    # ストロングパラメーター
    Payment.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                   building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end

class OrderShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :address_line, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は無効です。 ハイフン(-)を含めてください' }
    validates :phone_number, length: { minimum: 10, maximum: 11 },
                             format: { with: /\A[0-9]+\z/, message: 'は無効です。 半角数字のみです' }
    validates :city, :address_line, :item_id, :user_id, :token
  end
  validates :area_id, numericality: { other_than: 0, message: "を選んでください" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal_code: postal_code, area_id: area_id, city: city, address_line: address_line, building: building,
                    phone_number: phone_number, order_id: order.id)
  end
end

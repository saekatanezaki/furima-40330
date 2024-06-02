class CheckOut< ApplicationRecord
  include ActiveModel::Model

  attr_accessor :city, :addresses, :building, :phone_number, :prefecture_id, :postal_code, :user_id, :item_id, :token
  attr_accessor :item
  def user=(user)
    @user = user
  end
  def item=(item)
    @item = item
  end
  validates :city, presence: true
  validates :addresses, presence: true
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'must be in the format 123-4567' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'must be 10 or 11 digits' }
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(
      postal_code: postal_code,
    prefecture_id: prefecture_id,
    city: city,
    addresses: addresses,
    building: building,
    phone_number: phone_number,
    order_id: order.id
    )
  end
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :image, presence: true
  validates :item_name, presence: true
  validates :content, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, presence: true
  validates :status_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_status_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :scheduled_delivery_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, format: { with: /\A\d+\z/, message: 'should contain only half-width numerals' }

  def was_attached?
    image.attached?
  end
end

class Order < ActiveHash::Base
  validates :user, foreign_key: true, presence: true
  validates :item, foreign_key: true, presence: true

  include ActiveHash::Associations
  has_one :item
  belongs_to :user
end

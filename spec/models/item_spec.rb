require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  it 'image、item_name、content、price、category_id、status_id、shipping_status_id、prefecture_id、scheduled_delivery_id、priceが存在すれば登録できる' do
    expect(@item).to be_valid
  end
  it 'item_nameが空では出品できない' do
    @item.item_name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Item name can't be blank"
  end
  it 'contentが空では出品できない' do
    @item.content = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Content can't be blank"
  end
  it 'priceが空では出品できない' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Price can't be blank"
  end
  it 'category_idが空では出品できない' do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Category can't be blank"
  end
  it 'status_idが空では出品できない' do
    @item.status_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Status can't be blank"
  end
  it 'shipping_status_idが空では出品できない' do
    @item.shipping_status_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Shipping status can't be blank"
  end
  it 'prefecture_idが空では出品できない' do
    @item.prefecture_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Prefecture can't be blank"
  end
  it 'scheduled_delivery_idが空では出品できない' do
    @item.scheduled_delivery_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Scheduled delivery can't be blank"
  end
end

# item_name { Faker::Commerce.product_name }
#     content { Faker::Lorem.sentence }
#     price { Faker::Number.between(from: 300, to: 9_999_999) }
#     category_id { Faker::Number.between(from: 1, to: 100) }
#     status_id { Faker::Number.between(from: 1, to: Status.count) }
#     shipping_status_id { Faker::Number.between(from: 1, to: ShippingStatus.count) }
#     prefecture_id { Faker::Number.between(from: 2, to: 48) }
#     scheduled_delivery_id { FactoryBot.create(:scheduled_delivery).id }
#     after(:build) do |message|
#       message.image.attach

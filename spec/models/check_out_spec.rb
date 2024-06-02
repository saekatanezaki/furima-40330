require 'rails_helper'

RSpec.describe CheckOut, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:check_out, user_id: user.id, item_id: item.id )
  end



describe '商品購入機能' do
  context '内容に問題ない場合' do
  it 'postal_codeとprefecture、addressesとcityとphone_numberとStatusとShipping_statusが存在すれば登録できる' do
    expect(@order).to be_valid
  end

  it 'buildingは空でも保存できること' do
    @order.building = ''
    expect(@order).to be_valid
  end
end

  context '内容に問題がある場合' do
  it 'postal_codeが正しい形式でなければ登録できない' do
    @order.postal_code = '1234567'
    @order.valid?
    expect(@order.errors.full_messages).to include "Postal code must be in the format 123-4567"
  end

  it 'cityがなければ登録できない' do
    @order.city = ""
    @order.valid?
    expect(@order.errors.full_messages).to include "City can't be blank"
  end



  it 'phone_numberが11桁でなければ登録できない' do
    @order.phone_number = '123456789'
    expect(@order).to_not be_valid
  end

  it 'prefectureがなければ登録できない' do
    @order.prefecture_id = ""
    @order.valid?
    expect(@order.errors.full_messages).to include "Prefecture can't be blank"
  end

  it 'tokenがなければ登録できない' do
    @order.token = ""
    @order.valid?
    expect(@order.errors.full_messages).to include "Token can't be blank"
  end


  it 'addressesがなければ登録できない' do
    @order.addresses = ""
    @order.valid?
    expect(@order.errors.full_messages).to include "Addresses can't be blank"
  end

  it 'userが紐付いていないと保存できないこと' do
    @order.user_id = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("User can't be blank")
  end

  it 'itemが紐付いていないと保存できないこと' do
    @order.item_id = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Item can't be blank")
  end
end
end
end

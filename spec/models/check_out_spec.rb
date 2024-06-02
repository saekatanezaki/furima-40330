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

  it 'buildingは空でも購入できること' do
    @order.building = ''
    expect(@order).to be_valid
  end
end

  context '内容に問題がある場合' do
  it 'postal_codeが正しい形式でなければ購入できない' do
    @order.postal_code = '1234567'
    @order.valid?
    expect(@order.errors.full_messages).to include "Postal code must be in the format 123-4567"
  end

  it 'cityがなければ購入できない' do
    @order.city = ""
    @order.valid?
    expect(@order.errors.full_messages).to include "City can't be blank"
  end



  it 'phone_numberがなければ購入できない' do
    @order.phone_number = ""
    @order.valid?
    expect(@order.errors.full_messages).to include "Phone number can't be blank"
  end

  it 'phone_numberが12桁以上では購入できない' do
    @order.phone_number = '1234567891234'
    @order.valid?
    expect(@order.errors.full_messages).to include "Phone number must be less than 12 digits"
  end

  it 'phone_numberが9桁以下では購入できない' do
    @order.phone_number = '12345678'
    @order.valid?
    expect(@order.errors.full_messages).to include "Phone number must be more than 9 digits"
  end

  it 'phone_numberに半角数字以外が含まれている場合は購入できない' do
    @order.phone_number = '１2323456789'
    @order.valid?
    expect(@order.errors.full_messages).to include "Phone number must be 10 or 11 digits and only contain half-width numbers"
  end

  it 'prefectureに「---」が選択されているときは購入できない' do
    @order.prefecture_id = '1'
    @order.valid?
    expect(@order.errors.full_messages).to include "Prefecture can't be blank"
  end

  it 'tokenがなければ購入できない' do
    @order.token = ""
    @order.valid?
    expect(@order.errors.full_messages).to include "Token can't be blank"
  end

  it 'postal_codeがなければ購入できない' do
    @order.postal_code = ""
    @order.valid?
    expect(@order.errors.full_messages).to include "Postal code can't be blank"
  end


  it 'addressesがなければ購入できない' do
    @order.addresses = ""
    @order.valid?
    expect(@order.errors.full_messages).to include "Addresses can't be blank"
  end

  it 'userが紐付いていないと購入できないこと' do
    @order.user_id = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("User can't be blank")
  end

  it 'itemが紐付いていないと購入できないこと' do
    @order.item_id = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Item can't be blank")
  end
end
end
end

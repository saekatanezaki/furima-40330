# require 'rails_helper'

# RSpec.describe CheckOut, type: :model do
#   before do
#     user = FactoryBot.create(:user)
#     item = FactoryBot.create(:item)
#     @order = FactoryBot.build(:check_out, user: user.id, item: item.id)
#     @order.valid
# end


# describe '商品購入機能' do
#   it 'postal_codeとprefecture、addressesとcityとphone_numberが存在すれば登録できる' do
#     expect(@order).to be_valid
#   end

#   it 'postal_codeが正しい形式でなければ登録できない' do
#     @order.postal_code = '1234567'
#     expect(@order.errors.full_messages).to include "Postal code must be in the format 123-4567"
#   end

#   it 'postal_codeがなければ登録できない' do
#     @order.postal_code = ""
#     expect(@order.errors.full_messages).to include "Postal code can't be blank"
#   end

#   it 'phone_numberが11桁でなければ登録できない' do
#     @order.phone_number = '123456789'
#     expect(@order).to_not be_valid
#   end
# end
# end

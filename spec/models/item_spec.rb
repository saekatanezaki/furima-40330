require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe 'ユーザー新規登録' do
    context '商品登録できるとき' do
      it 'image、item_name、content、price、category_id、status_id、shipping_status_id、prefecture_id、scheduled_delivery_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      context '商品登録ができないとき' do
        it 'item_nameが空では出品できない' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Item name can't be blank"
        end
        it 'contentが空ときは出品できない' do
          @item.content = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Content can't be blank"
        end
        it 'priceが空のときは出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Price can't br blank"
        end
        it 'category_idに「---」が選択されているときは出品できない' do
          @item.category_id = '---'
          @item.valid?
          expect(@item.errors.full_messages).to include "Category can't include ---"
        end
        it 'status_idに「---」が選択されているときは出品できない' do
          @item.status_id = '---'
          @item.valid?
          expect(@item.errors.full_messages).to include "Status can't include ---"
        end
        it 'shipping_status_idに「---」が選択されているときは出品できない' do
          @item.shipping_status_id = '---'
          @item.valid?
          expect(@item.errors.full_messages).to include "Shipping status can't include ---"
        end
        it 'prefecture_idに「---」が選択されているときは出品できない' do
          @item.prefecture_id = '---'
          @item.valid?
          expect(@item.errors.full_messages).to include "Prefecture can't include ---"
        end
        it 'scheduled_delivery_idに「---」が選択されているときは出品できない' do
          @item.scheduled_delivery_id = '---'
          @item.valid?
          expect(@item.errors.full_messages).to include "Scheduled delivery can't include ---"
        end
        it 'priceが全角数字だと保存できないこと' do
          @item.price = '２０００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is invalid')
        end
        it 'priceが300円未満では保存できないこと' do
          @item.price = 300
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is invalid')
        end
        it 'priceが1,000,000円を超過すると保存できないこと' do
          @item.price = 1_000_001
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is invalid')
        end
        it 'ユーザーが紐付いていなければ投稿できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
      end
    end
  end
end

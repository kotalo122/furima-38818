require 'rails_helper'

RSpec.describe OrderShipment, type: :model do
  before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipment = FactoryBot.build(:order_shipment, user_id: user.id, item_id: item.id)
    end

    describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipment).to be_valid
        end
      it 'building_nameが空でも保存できる' do
        @order_shipment.building_name = ''
        expect(@order_shipment).to be_valid
        end
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_shipment.post_code = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipment.post_code = '1234567'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idを空だと保存できないこと' do
        @order_shipment.prefecture_id = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idに「---」が選択されている場合は出品できない' do
        @order_shipment.prefecture_id = '1'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Prefecture Prefecture can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @order_shipment.city  = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空だと保存できないこと' do
        @order_shipment.block  = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Block can't be blank")
      end
      
      it 'phoneが空だと保存できないこと' do
        @order_shipment.phone  = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneにハイフンが含まない正しい形式でないと保存できないこと' do
        @order_shipment.phone  = '090-0000-1111'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_shipment.user_id = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order_shipment.item_id = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Item can't be blank")
      end

  end
end
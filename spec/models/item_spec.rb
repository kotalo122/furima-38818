require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item) 
  end


  describe '新規出品' do
      context '新規出品できる場合' do
        it "item_name,discription,category_id,condition_id,price,shipping_fee_id,prefecture_id,ship_day_id,image,user_idの値が存在すれば出品できる" do
          expect(@item).to be_valid
        end
        
      end

      context '新規出品できない場合' do
        it "item_nameが空の場合は出品できない" do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end

        it "discription,が空の場合は出品できない" do
          @item.discription = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Discription can't be blank")
        end

        it "category_idが空の場合は出品できない" do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it "category_idに「---」が選択されている場合は出品できない" do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Category Category can't be blank")
        end

        it "condition_idが空の場合は出品できない" do
          @item.condition_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end

        it "condition_idに「---」が選択されている場合は出品できない" do
          @item.condition_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition Condition can't be blank")
        end

        it "shipping_fee_idが空の場合は出品できない" do
          @item.shipping_fee_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
        end

        it "shipping_fee_idに「---」が選択されている場合は出品できない" do
          @item.shipping_fee_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee Shipping fee can't be blank")
        end

        it "prefecture_idが空の場合は出品できない" do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end

        it "prefecture_idに「---」が選択されている場合は出品できない" do
          @item.prefecture_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture Prefecture can't be blank")
        end

        it "ship_day_idが空の場合は出品できない" do
          @item.ship_day_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Ship day can't be blank")
        end

        it "ship_day_idに「---」が選択されている場合は出品できない" do
          @item.ship_day_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Ship day Ship_day can't be blank")
        end

        it "priceが空の場合は出品できない" do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it "priceが全角では出品できない" do
          @item.price = '５００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be between ¥300 and ¥9,999,999")
        end
        
        it "priceが数字以外（アルファベット、漢字、ひらがな、カタカナ）では出品できない" do
          @item.price = '一万'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be between ¥300 and ¥9,999,999")
        end

        it "priceが299以下では出品できない" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be between ¥300 and ¥9,999,999")
        end

        it "priceが10000000以上では出品できない" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be between ¥300 and ¥9,999,999")
        end

        it "priceが小数点以下では出品できない" do
          @item.price = 333.3
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be between ¥300 and ¥9,999,999")
        end

        it "imageが空の場合は出品できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it "userが紐付いていなければ出品できない" do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end

      end
    end
  end
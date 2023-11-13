require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address,user_id:@user.id,item_id:@item.id)
    # この記述がないとMySQLのエラーとなる
    sleep(0.1) 
  end

  describe '購入操作' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力できていれば保存できる' do
        expect(@order_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できない' do
        @order_address.postalcode = ""
        @order_address.valid?
        # include 期待結果が含まれているか検証
        expect(@order_address.errors.full_messages).to include "Postalcode can't be blank"
      end
      it '郵便番号に-が入っていないと保存できない' do
        @order_address.postalcode = "1234567"
        @order_address.valid?
        # include 期待結果が含まれているか検証
        expect(@order_address.errors.full_messages).to include "Postalcode is invalid"
      end
      it '都道府県が空だと保存できない' do
        @order_address.prefecture_id = "1"
        @order_address.valid?
        # include 期待結果が含まれているか検証
        # binding.pry
        expect(@order_address.errors.full_messages).to include 'Prefecture must be other than 1'
      end
      it '市区町村が空だと保存できない' do
        @order_address.city = nil
        @order_address.valid?
        # include 期待結果が含まれているか検証
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it '番地が空だと保存できない' do
        @order_address.block = ""
        @order_address.valid?
        # binding.pry
        # include 期待結果が含まれているか検証
        expect(@order_address.errors.full_messages).to include "Block can't be blank"
      end
      it '電話番号が空だと保存できない' do
        @order_address.phone_number = ""
        @order_address.valid?
        # include 期待結果が含まれているか検証
        expect(@order_address.errors.full_messages).to include "Phone_number can't be blank"
      end
      it '電話番号に-が入ると保存できない' do
        @order_address.phone_number = "080-1234-12"
        @order_address.valid?
        # include 期待結果が含まれているか検証
        expect(@order_address.errors.full_messages).to include "Phone number is invalid. Input numbers only"
      end
      it 'トークンが空だと保存できない' do
        @order_address.token = ""
        @order_address.valid?
        # include 期待結果が含まれているか検証
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
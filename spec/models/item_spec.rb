require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力できていれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it '画像が空だと保存できない' do
        @item.image = nil
        @item.valid?
        # include 期待結果が含まれているか検証
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空だと保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'nameが41文字以上だと保存できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include 'Name is too long (maximum is 40 characters)'
      end
      it '商品の説明が空だと保存できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it '商品の説明が1001文字以上だと保存できない' do
        @item.explanation = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include 'Explanation is too long (maximum is 1000 characters)'
      end
      it 'categoryが空だと保存できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '品質が空だと保存できない' do
        @item.quality_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Quality can't be blank"
      end
      it '配送料負担者が空だと保存できない' do
        @item.shipping_cost_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost can't be blank"
      end
      it '発送元地域が空だと保存できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it '配送日が空だと保存できない' do
        @item.shipping_date_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping date can't be blank"
      end
      it '価格が空だと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格が299円以下だと保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it '価格が10000000円以上だと保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
    end
  end
end

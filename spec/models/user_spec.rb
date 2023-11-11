require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '内容に問題ない場合' do
      it "すべての値が正しく入力できていれば保存できる" do
        expect(@user).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it "nicknameが空だと保存できない" do
        @user.nickname = ""
        @user.valid?
        # include 期待結果が含まれているか検証
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "パスワードに英数字が含まれてないと保存できない" do
        @user.password = "testtest"
        @user.password_confirmation = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password Password is invalid. Include both letters and numbers"
      end
      it "名字が全角日本語でないと保存できない" do
        @user.last_name = "asaka"
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name Last name is invalid. Input full-width characters'
      end
      it "名前が全角日本語でないと保存できない" do
        @user.first_name = "sora"
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name First name is invalid. Input full-width characters'
      end
      it "名字が全角カタカナでないと保存できない" do
        @user.last_name_kana = "浅賀"
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana Last name kana is invalid. Input full-width katakana characters'
      end
      it "名前が全角カタカナでないと保存できない" do
        @user.first_name_kana = "宇宙"
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana First name kana is invalid. Input full-width katakana characters'
      end
      
      it '生年月日が空だと保存できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end

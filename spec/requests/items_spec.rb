require 'rails_helper'
RSpec.describe ItemsController, type: :request do

  
  before do
    @item = FactoryBot.create(:item)
    # この記述がないとMySQLのエラーとなる
    sleep(0.1) 
  end

  # include BasicSupport
  describe 'リクエストに対するレスポンスの確認' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      basic(root_path)
      # eq 完全一致する値が返ってくるかどうか
      # HTTP通信の処理結果コードが一致するか
      expect(response.status).to eq 200
    end
    it 'newアクションにリクエストすると正常にレスポンスが返ってくる' do
      basic(new_item_path)
      # eq 完全一致する値が返ってくるかどうか
      # HTTP通信の処理結果コードが一致するか
      # サインインページにリダイレクトするか確認
      expect(response.status).to eq 302
    end
    it 'editアクションにリクエストすると正常にレスポンスが返ってくる' do
      basic(edit_item_path(@item.id))
      # eq 完全一致する値が返ってくるかどうか
      # HTTP通信の処理結果コードが一致するか
      # サインインページにリダイレクトするか確認
      expect(response.status).to eq 302
    end
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      basic(item_path(@item.id))
      # eq 完全一致する値が返ってくるかどうか
      # HTTP通信の処理結果コードが一致するか
      # サインインページにリダイレクトするか確認
      expect(response.status).to eq 302
    end
  end
end
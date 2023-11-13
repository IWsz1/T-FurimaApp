require 'rails_helper'
RSpec.describe 'Orders', type: :request do

  before do
    @item = FactoryBot.create(:item)
    # この記述がないとMySQLのエラーとなる
    sleep(0.1) 
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      # get 後述へリクエストを送る
      basic(item_orders_path(@item))
      # eq 完全一致する値が返ってくるかどうか
      # HTTP通信の処理結果コードが一致するか
      expect(response.status).to eq 302
    end
  end
end
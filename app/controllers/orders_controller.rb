class OrdersController < ApplicationController
  # アクションを行おうとした際にログインされてなかったらログインページに遷移する設定
  before_action :authenticate_user!

  def index
    # 親コントローラーのidのため[:id]でなく[:item_id]
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(orderaddress_params)
    # フォームオブジェクトの場合は.saveではバリデーション確認ができない為、.valid?を使う
    if @order_address.valid?
      # payjpに金額を送る用
      @item = Item.find(params[:item_id])
      pay_item
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private
  
  def orderaddress_params
    # binding.pry
    # paramsのハッシュがordaraddressと変数名を設定してもorder_address二変化するるため注意
    params.require(:order_address).permit(:postalcode,:prefecture_id,:city,:block,:building,:phone_number).merge(user_id: current_user.id,item_id:params[:item_id],token:params[:token])
  end
  
  def pay_item
    # PayjpのGemが提供するPayjpクラスのapi_keyと言うインスタンスに秘密鍵を代入してPayjpに送信
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    # Payjp::Charge.createクラスメソッドにユーザーの情報を代入してPayjpに送信
    Payjp::Charge.create(
      # 金額
      amount:@item.price,
      # トークン
      card:orderaddress_params[:token],
      # 通貨
      currency:"jpy"
    )
  end
end
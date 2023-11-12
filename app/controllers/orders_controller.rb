class OrdersController < ApplicationController
  def index
    # 親コントローラーのidのため[:id]でなく[:item_id]
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(orderaddress_params)
    # binding.pry
    # フォームオブジェクトの場合は.saveではバリデーション確認ができない為、.valid?を使う
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  def orderaddress_params
    # paramsのハッシュがordaraddressと変数名を設定してもorder_address二変化するるため注意
    params.require(:order_address).permit(:postalcode,:prefecture_id,:city,:block,:building,:phone_number).merge(user_id: current_user.id,item_id:params[:item_id])
  end
end
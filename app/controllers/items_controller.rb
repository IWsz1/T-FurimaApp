class ItemsController < ApplicationController
  # index以外のアクションを行おうとした際にログインされてなかったらログインページに遷移する設定
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image,:name,:explanation,:category_id,:quality_id,:shipping_cost_id,:area_id,:shipping_date_id,:price).merge(user_id: current_user.id)
  end
end

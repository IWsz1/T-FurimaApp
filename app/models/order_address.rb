class OrderAddress
  # 下記読み込みでFormオブジェクトが利用できるようになる
  include ActiveModel::Model
  # フォームオブジェクトに下記仮想カラムを追加
  attr_accessor :user_id, :item_id, :postalcode, :prefecture_id, :city, :block, :building, :phone_number

  # # フォームオブジェクトではactiveHashとのアソシエーションがいらない？
  # # 下記の記述でActiveHashとmodelをアソシエーションで結ぶ
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :area

  with_options presence:true do
    validates :postalcode, format:{with:/\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id,numericality:{other_than:1}
    validates :city
    validates :block
    validates :phone_number
    # ハイフンを認めない半角数字のみ許可 htmlで11桁指定にはされてる
    validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input numbers only' }
    # アソシエーションで自動的についていたpresenceをformオブジェクトのバリデーションでは追記
    validates :user_id
    validates :item_id
  end
  def save
    @order = Order.create(item_id: item_id, user_id: user_id)
    # ストロングパラメーターでは無いためmergeは使わない
    Address.create(postalcode: postalcode, prefecture_id: prefecture_id,city: city, block:block,building:building,phone_number:phone_number,order_id:@order.id)
  end
end

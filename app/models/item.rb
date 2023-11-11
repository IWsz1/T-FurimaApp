class Item < ApplicationRecord
  belongs_to :user
  # 画像モデルとつながる
  has_one_attached :image

  # 下記の記述でActiveHashとmodelをアソシエーションで結ぶ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :quality
  belongs_to :shipping_cost
  belongs_to :shipping_date

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    # 初めのid0の選択項目は表示用のため選択されても選択出来ていないよとエラーを出す
    validates :category_id,numericality:{other_than:0,message:"can't be blank"}
    validates :quality_id,numericality:{other_than:0,message:"can't be blank"}
    validates :shipping_cost_id,numericality:{other_than:0,message:"can't be blank"}
    validates :area_id,numericality:{other_than:1,message:"can't be blank"}
    validates :shipping_date_id,numericality:{other_than:0,message:"can't be blank"}
    # only_integerで整数のみに
    # 後半で1以上1000000以下の数字にバリデーション
    validates :price,numericality: {only_integer:true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
end

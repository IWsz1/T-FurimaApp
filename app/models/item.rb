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
    validates :exceplanation, length: { maximum: 1000 }
    validates :name
    validates :name
    validates :name
    validates :name
    validates :name
    # only_integerで整数のみに
    # 後半で1以上1000000以下の数字にバリデーション
    validates :price,numericality: {only_integer:true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
end

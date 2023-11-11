class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

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

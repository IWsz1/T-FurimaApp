class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  # トークンという値を取り扱えるようになる
  # カラムは増えてない
  attr_accessor:token
end

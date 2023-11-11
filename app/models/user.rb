class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 0~?番目に英字が来るかつ0~?番目に数字が来る。すべての文字が英数字で作られている。大文字小文字は問わない。
  # \Aで、?=.で?~、.*?で~?、[a-z]でa~zが含まれることを決める、\dで数字が含まれることを決める(0~?番目に英字が来るかつ0~?番目に数字が来る。)
  # [a-z\d]で数字又は英字、+で前述の文字列(0文字目から)で、\z最後まで終わることを決める(すべての文字が英数字で作られている。)
  # iで大文字小文字を問わない
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Password is invalid. Include both letters and numbers'} 

  with_options presence: true do
    validates :nickname
    # 全角ひらがな、全角カタカナ、漢字、長音記号
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Last name is invalid. Input full-width characters' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'First name is invalid. Input full-width characters' }
    # 全角カタカナ
    validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'Last name kana is invalid. Input full-width katakana characters'}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'First name kana is invalid. Input full-width katakana characters'}
    validates :birthday
  end
end

FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    # Faker gem に含まれるInternetカテゴリのunique.emailメソッドを呼び出し、一意のランダムなメールアドレスを生成
    email { Faker::Internet.unique.email }
    # ランダムで生成する際、英数字になるよう'1a'追加 6文字以下
    password { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    last_name{"山田"}
    first_name{"太郎"}
    last_name_kana{"ヤマダ"}
    first_name_kana {"タロウ"}
    birthday { Faker::Date.birthday }
  end
end

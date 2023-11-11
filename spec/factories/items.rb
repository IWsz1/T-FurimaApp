FactoryBot.define do
  factory :item do
    association :user
    # テスト用の画像ファイルを添付
    after(:build) do |item|
      # imageに対してio:file.openで開いた箇所にあるファイルをitem-sample.pngというファイル名で保存する
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item_sample.png')
    end
    name { Faker::Name.name }
    explanation { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to: 10) }
    quality_id { Faker::Number.between(from: 1, to: 6) }
    shipping_cost_id { Faker::Number.between(from: 1, to: 2) }
    area_id { Faker::Number.between(from: 2, to: 48) }
    shipping_date_id { Faker::Number.between(from: 1, to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
  end
end

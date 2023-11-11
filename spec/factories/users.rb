FactoryBot.define do
  factory :user do
    nickname { 'sora' }
    email { 'test@test' }
    password{"123abc"}
    password_confirmation { password }
    last_name{"浅賀"}
    first_name{"宇宙"}
    last_name_kana{"アサカ"}
    first_name_kana {"ソラ"}
    birthday{"1932-03-03"}
  end
end

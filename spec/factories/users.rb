FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6, mix_case: true, special_characters: false) }
    password_confirmation { password }
    sei { Gimei.last.kanji }
    mei { Gimei.first.kanji }
    sei_kana { Gimei.last.katakana }
    mei_kana { Gimei.first.katakana }
    birthday { Faker::Date.birthday }
  end
end

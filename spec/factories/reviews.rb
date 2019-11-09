FactoryBot.define do
  factory :review do
    artist {"テストバンド"}
    venue {"テスト会場"}
    text {"hello!"}
    image {"hoge.png"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end
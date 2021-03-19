FactoryBot.define do
  factory :shelter do
    sequence(:name, 1000) { |n| "Shelter #{n}" }
    rank { rand(1..10) }
    city { %w[ıstanbul Ankara Izmir Eskisehir].sample }
  end
end

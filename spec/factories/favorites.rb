FactoryBot.define do
  factory :favorite do
    association :user
    association :post
    user { post.user }
  end
end

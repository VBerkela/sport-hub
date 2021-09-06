FactoryBot.define do
  factory :comment do
    comment {"Hello"}
    article_id {1}
    user_id {1}
  end
end

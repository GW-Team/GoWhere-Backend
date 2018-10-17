FactoryBot.define do
  factory :favorite do
    news_feed   { create(:news_feed) }
    user        { create(:user) }
  end
end

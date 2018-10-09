FactoryBot.define do
  factory :follower do
    follower  { create(:user) }
    user      { create(:user) }
  end
end

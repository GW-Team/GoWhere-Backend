FactoryBot.define do
  factory :follower_apply_form do
    follower  { create(:user) }
    user      { create(:user) }
  end
end

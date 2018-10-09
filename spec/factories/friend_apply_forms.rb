FactoryBot.define do
  factory :friend_apply_form do
    apply   { create(:user) }
    user    { create(:user) }
  end
end

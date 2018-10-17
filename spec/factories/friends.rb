FactoryBot.define do
  factory :friend do
    friend  { create(:user) }
    user    { create(:user) }
  end
end

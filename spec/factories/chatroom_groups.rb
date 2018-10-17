FactoryBot.define do
  factory :chatroom_group do
    chatroom  { create(:chatroom) }
    user      { create(:user) }
  end
end

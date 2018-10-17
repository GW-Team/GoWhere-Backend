FactoryBot.define do
  factory :chatroom_photo do
    chatroom  { create(:chatroom) }
    path      { Faker::Internet.url }
  end
end

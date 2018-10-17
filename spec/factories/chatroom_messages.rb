FactoryBot.define do
  factory :chatroom_message do
    message_type  { 1 }
    content       { Faker::Lorem.sentence }
    chatroom_id   { create(:chatroom) }
    user          { create(:user) }
  end
end

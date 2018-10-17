require 'rails_helper'

RSpec.describe Chatroom, type: :model do
  describe "associations" do
    it { have_many(:chatroom_photos).dependent(:destroy) }
    it { have_many(:chatroom_notes).dependent(:destroy) }
    it { have_many(:chatroom_messages).dependent(:destroy) }
    it { have_many(:activity).dependent(:destroy) }
    it { have_many(:chatroom_groups).dependent(:destroy) }
  end

  describe '.admins' do
    let(:chatroom) { create(:chatroom) }
    let(:user)     { create(:user) }

    it 'has user' do
      create(:chatroom_group, chatroom: chatroom, user: user, is_admin: true)
      expect(chatroom.admins).to include user.id
    end
  end

  describe '.users' do
    let(:chatroom) { create(:chatroom) }
    let(:user)     { create(:user) }

    it 'has user' do
      create(:chatroom_group, chatroom: chatroom, user: user)
      expect(chatroom.users).to include user.id
    end
  end
end

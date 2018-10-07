require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { have_many(:news_feeds).dependent(:destroy) }
    it { have_many(:news_feed_likes).dependent(:destroy) }
    it { have_many(:news_feed_comments).dependent(:destroy) }
    it { have_many(:friends_friend).dependent(:destroy).class_name(:Friend).with_foreign_key(:friend_id) }
    it { have_many(:users_friend).dependent(:destroy).class_name(:Friend).with_foreign_key(:user_id) }
    it { have_many(:applicants_friend_apply_form).dependent(:destroy).class_name(:FriendApplyForm).with_foreign_key(:apply_id) }
    it { have_many(:users_friend_apply_form).dependent(:destroy).class_name(:FriendApplyForm).with_foreign_key(:user_id) }
    it { have_many(:users_follower).dependent(:destroy).class_name(:Follower).with_foreign_key(:user_id) }
    it { have_many(:followers_follower).dependent(:destroy).class_name(:Follower).with_foreign_key(:follower_id) }
    it { have_many(:users_follower_apply_form).dependent(:destroy).class_name(:FollowerApplyForm).with_foreign_key(:user_id) }
    it { have_many(:followers_follower_apply_form).dependent(:destroy).class_name(:FollowerApplyForm).with_foreign_key(:follower_id) }
    it { have_many(:favorites).dependent(:destroy) }
    it { have_many(:chatroom_note_comments).dependent(:destroy) }
    it { have_many(:chatroom_notes).dependent(:destroy) }
    it { have_many(:chatroom_messages).dependent(:destroy) }
    it { have_many(:chatroom_groups).dependent(:destroy) }
    it { have_many(:activity_participants).dependent(:destroy) }
    it { have_many(:activity_comments).dependent(:destroy) }
  end

  describe 'validates' do
    it { validate_presence_of(:first_name) }
    it { validate_presence_of(:last_name) }
  end

  describe '.reset_password' do
    let(:user) { create(:user) }

    it 'change password' do
      pwd = user.password
      user.reset_password

      expect(user.reload.password).not_to eq pwd
    end
  end

  describe '.display_name' do
    it 'has nickname' do
      nickname = 'Dog King'  
      user = create(:user, nickname: nickname)

      expect(user.display_name).to eq nickname
    end

    it 'has first name and last name' do
      user = create(:user)
      display_name = "#{user.first_name} #{user.last_name}"

      expect(user.display_name).to eq display_name
    end
  end

  describe '.list_name' do
    it 'has nickname' do
      nickname = 'Dog King'  
      user = create(:user, nickname: nickname)
      list_name = "#{user.first_name} #{user.last_name} (#{nickname})"
      
      expect(user.list_name).to eq list_name
    end

    it 'only has first name and last name' do
      user = create(:user)
      list_name = "#{user.first_name} #{user.last_name}"

      expect(user.list_name).to eq list_name
    end
  end
end

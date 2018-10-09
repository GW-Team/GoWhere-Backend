require 'rails_helper'

RSpec.describe FriendApplyForm, type: :model do
  describe "associations" do
    it { belong_to(:apply).class_name(:User).with_foreign_key(:apply_id) }
    it { belong_to(:user).class_name(:User).with_foreign_key(:user_id) }
  end
end

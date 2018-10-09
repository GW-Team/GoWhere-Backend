require 'rails_helper'

RSpec.describe Follower, type: :model do
  describe "associations" do
    it { belong_to(:follower).class_name(:User).with_foreign_key(:follower_id) }
    it { belong_to(:user).class_name(:User).with_foreign_key(:user_id) }
  end
end

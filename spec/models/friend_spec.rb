require 'rails_helper'

RSpec.describe Friend, type: :model do
  describe "associations" do
    it { belong_to(:friend).class_name(:User).with_foreign_key(:friend_id) }
    it { belong_to(:user).class_name(:User).with_foreign_key(:user_id) }
  end
end

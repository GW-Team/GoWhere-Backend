require 'rails_helper'

RSpec.describe ChatroomGroup, type: :model do
  describe "associations" do
    it { belong_to(:chatroom) }
    it { belong_to(:user) }
  end
end

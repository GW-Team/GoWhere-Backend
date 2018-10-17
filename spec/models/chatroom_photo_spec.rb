require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it  { belong_to(:chatroom) }
  end
end

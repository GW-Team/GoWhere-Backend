require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe "associations" do
    it { belong_to(:user) }
    it { belong_to(:news_feed) }
  end
end

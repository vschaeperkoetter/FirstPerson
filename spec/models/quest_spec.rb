require 'rails_helper'

RSpec.describe Quest, :type => :model do
  it {should belong_to(:creator).class_name('User')}
  it {should have_many(:rewards)}
  it {should have_many(:user_quests)}
  it {should have_many(:users).through(:user_quests)}
  it {should have_many(:checkpoints)}
  it {should have_many(:locations).through(:checkpoints)}
  
  describe "Quest Model" do
    it "returns a location using the location method" do
      quest = FactoryGirl.create(:quest)
      expect(quest.locations.first).to eq(quest.location)
    end

    it "sets user status to 'full' when equal or over user limit" do
      quest = FactoryGirl.create(:quest, user_limit: 1)
      expect(quest.userstatus).to eq("full")
    end
  end
end

require 'rails_helper'

feature "Quests", :type => :feature do
  describe "User Quests page" do

    it "gives a 200 status code" do
      visit '/'
      expect(page.status_code).to eq(200)
    end

    it "renders the quest title div" do
      visit '/quests'
      expect(page).to have_content("your quests")
    end

    it "renders the quest list" do
      visit '/quests'
      expect(page).to have_css(".list")
    end

    it "renders 'Create a quest' Form" do
      visit '/quests'
      expect(page).to have_css('#create_quest_but')
    end

    it "renders 'Here are your quests!'" do
      visit '/quests'
      expect(page).to have_content("Here are your quests!")
    end

    it "renders side menu" do
      visit '/quests'
      expect(page).to have_css('div#options.sidebar')
    end

    it "renders 'Your Active Quests' button" do
      visit '/quests'
      expect(page).to have_css('div#active_but.button')
    end

    it "renders quest content area" do
      visit '/quests'
      expect(page).to have_css('div#content')
    end

    it "lists quest info " do
      visit '/quests'
      expect(page).to have_css('div.list')
    end

  end
  
end

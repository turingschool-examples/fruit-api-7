require "rails_helper"

RSpec.describe "/", type: :feature do
  describe "landing page" do
    before(:each) do
      visit root_path
    end

    it "shows a search form", :vcr do
      fill_in "Search for Fruit", with: "apple"
      click_on "Search"

      expect(current_path).to eq(fruits_path)
    end
  end
end

require "rails_helper"

RSpec.describe "/fruits", type: :feature do
  before(:each) do
    visit root_path
  end

  describe "fruits search results" do
    it "shows a fruit based on search results", :vcr do
      fill_in "Search for Fruit", with: "apple"
      click_on "Search"

      expect(current_path).to eq(fruits_path)
      expect(page).to have_content("Name: Apple")
      expect(page).to have_content("Family: Rosaceae")
      expect(page).to have_content("Order: Rosales")
      expect(page).to have_content("Genus: Malus")
      expect(page).to have_content("Nutrition:")
      expect(page).to have_content("Calories: 52")
      expect(page).to have_content("Fat: 0.4")
      expect(page).to have_content("Sugar: 10.3")
      expect(page).to have_content("Carbohydrates: 11.4")
      expect(page).to have_content("Protein: 0.3")
    end
  end
end

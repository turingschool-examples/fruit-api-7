require "rails_helper"

RSpec.describe "/fruits/nutritional", type: :feature do
  before(:each) do
    visit root_path
  end

  describe "related fruits page" do
    it "shows a search form", :vcr do
      fill_in "Search for Fruit", with: "apple"
      click_on "Search"
      click_on "Find Similar Fruits by Nutrition Value"

      expect(current_path).to eq(fruits_nutritional_index_path)

      within("#related_fruit-Strawberry") do
        expect(page).to have_content("Name: Strawberry")
        expect(page).to have_content("Family: Rosaceae")
        expect(page).to have_content("Order: Rosales")
        expect(page).to have_content("Genus: Fragaria")
        expect(page).to have_content("Nutrition:")
        expect(page).to have_content("Calories: 29")
        expect(page).to have_content("Fat: 0.4")
        expect(page).to have_content("Sugar: 5.4")
        expect(page).to have_content("Carbohydrates: 5.5")
        expect(page).to have_content("Protein: 0.8")
      end

      within("#related_fruit-Blackberry") do
        expect(page).to have_content("Name: Blackberry")
        expect(page).to have_content("Family: Rosaceae")
        expect(page).to have_content("Order: Rosales")
        expect(page).to have_content("Genus: Rubus")
        expect(page).to have_content("Nutrition:")
        expect(page).to have_content("Calories: 40")
        expect(page).to have_content("Fat: 0.4")
        expect(page).to have_content("Sugar: 4.5")
        expect(page).to have_content("Carbohydrates: 9.0")
        expect(page).to have_content("Protein: 1.3")
      end
    end

    it "has a link for fruit name back to /fruits", :vcr do
      fill_in "Search for Fruit", with: "apple"
      click_on "Search"
      click_on "Find Similar Fruits by Nutrition Value"

      expect(current_path).to eq(fruits_nutritional_index_path)

      within("#related_fruit-Strawberry") do
        click_on "Name: Strawberry"
      end

      expect(current_path).to eq(fruits_path)

      expect(page).to have_content("Name: Strawberry")
      expect(page).to have_content("Family: Rosaceae")
      expect(page).to have_content("Order: Rosales")
      expect(page).to have_content("Genus: Fragaria")
      expect(page).to have_content("Nutrition:")
      expect(page).to have_content("Calories: 29")
      expect(page).to have_content("Fat: 0.4")
      expect(page).to have_content("Sugar: 5.4")
      expect(page).to have_content("Carbohydrates: 5.5")
      expect(page).to have_content("Protein: 0.8")
    end
  end
end

require 'rails_helper'

RSpec.describe 'the devs new page' do
    
    it "displays a 'Developer Name' field" do
        visit "/devs/new"

        expect(page).to have_field("name")
    end

    it "displays a 'Number of Employees' field" do
        visit "/devs/new"

        expect(page).to have_field("employees")
    end

    it "displays an 'operational status' checkbox" do
        visit "/devs/new"

        expect(page).to have_field("operational")
    end

    it "can create a new Developer and populate its fields" do
        visit "devs/new"
        fill_in("name", with: 'Plompo')
        fill_in("employees", with: '40')
        check("operational")
        click_button("create_developer")

        new_dev_id = Dev.last.id

        expect(current_path).to eq("/devs/#{new_dev_id}")
        expect(page).to have_content("Plompo")
        expect(page).to have_content("40")
        expect(page).to have_content("Operational: Yes")
    end
end
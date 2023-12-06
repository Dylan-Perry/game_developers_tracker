require 'rails_helper'

RSpec.describe 'the devs edit' do
    
    it "can edit the developer" do
        nintendo = Dev.create(name: "Nintendo", employees: 2, operational: false)

        visit "devs/#{nintendo.id}"

        expect(page).to have_content("Nintendo")
        expect(page).to have_content("2")
        expect(page).to have_content("No")

        click_link("Edit Developer")

        expect(current_path).to eq("/devs/#{nintendo.id}/edit")

        fill_in("name", with: 'Plompo')
        fill_in("employees", with: '40')
        check("operational")
        click_button("update_developer")

        expect(current_path).to eq("/devs/#{nintendo.id}")
        expect(page).to have_content("Plompo")
        expect(page).to have_content("40")
        expect(page).to have_content("Operational: Yes")
    end
end
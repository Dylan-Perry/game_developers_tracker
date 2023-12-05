require 'rails_helper'

RSpec.describe 'the games edit page' do
    before(:each) do
        @nintendo = Dev.create(name: "Nintendo", employees: 40, operational: true)
        @zelda = @nintendo.games.create(name: "The Legend of Zelda", players: 1, online: false)   
    end
    
    it "can edit the game" do
        visit "games/#{@zelda.id}"

        expect(page).to have_content("Zelda")
        expect(page).to have_content("1")
        expect(page).to have_content("Features: No")

        click_link("Edit Game")

        expect(current_path).to eq("/games/#{@zelda.id}/edit")

        fill_in("name", with: 'Bengis')
        fill_in("players", with: '4')
        check("online")
        click_button("update_game")

        expect(current_path).to eq("/games/#{@zelda.id}")

        expect(page).to have_content("Bengis")
        expect(page).to have_content("4")
        expect(page).to have_content("Features: Yes")
    end
end
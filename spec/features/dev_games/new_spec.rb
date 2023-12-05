require 'rails_helper'

RSpec.describe 'the games new page' do

    before(:each) do
        @nintendo = Dev.create(name: "Nintendo", employees: 40, operational: true)
    end
    
    it "displays a 'Game Name' field" do
        visit "devs/#{@nintendo.id}/games/new"

        expect(page).to have_field("name")
    end

    it "displays a 'Number of Players' field" do
        visit "devs/#{@nintendo.id}/games/new"

        expect(page).to have_field("players")
    end

    it "displays an 'has online' checkbox" do
        visit "devs/#{@nintendo.id}/games/new"

        expect(page).to have_field("online")
    end

    it "can create a new Game and populate its fields" do
        visit "devs/#{@nintendo.id}/games/new"
        
        fill_in("name", with: 'Doinkus')
        fill_in("players", with: '4')
        check("online")
        click_button("create_game")

        new_game_id = Game.last.id

        expect(current_path).to eq("/devs/#{@nintendo.id}/games")
        expect(page).to have_content("Doinkus")
        expect(page).to have_content("4")
        expect(page).to have_content("Online Features: Yes")
    end
end
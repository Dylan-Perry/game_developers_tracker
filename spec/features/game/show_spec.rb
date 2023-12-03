require 'rails_helper'

RSpec.describe 'the games show page' do
    before(:each) do
        @dev = Dev.create(name: "Cool Dev")
        @dev_2 = Dev.create(name: "Uncool Dev")
        @lil_pump = @dev.games.create!(name: "Lil Pump in the Big City", players: 2, online: false)
        @blonkis = @dev.games.create!(name: "Blonkis", players: 4, online: true)
    end
    
    it "displays a game's name" do
        visit "/games/#{@lil_pump.id}"

        expect(page).to have_content(@lil_pump.name)
        expect(page).to_not have_content(@blonkis.name)
    end

    it "displays a game's developer" do
        visit "/games/#{@lil_pump.id}"

        expect(page).to have_content(@lil_pump.dev.name)
        expect(page).to_not have_content(@dev_2.name)
    end

    it "displays a game's number of players" do
        visit "/games/#{@lil_pump.id}"

        expect(page).to have_content(@lil_pump.players)
        expect(page).to_not have_content(@blonkis.players)
    end

    it "displays whether or not a game has online play" do
        visit "/games/#{@lil_pump.id}"

        expect(page).to have_content(@lil_pump.online?)
        expect(page).to_not have_content(@blonkis.online?)
    end
end
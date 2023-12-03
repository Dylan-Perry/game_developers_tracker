require 'rails_helper'

RSpec.describe 'the dev_games index page' do
    before(:each) do
        @nintendo = Dev.create(name: "Nintendo", employees: 40, operational: true)
        @super_mario = @nintendo.games.create(name: "Super Mario Bros.", players: 2, online: false)
        @zelda = @nintendo.games.create(name: "The Legend of Zelda", players: 1, online: false)
        @starcraft = @nintendo.games.create(name: "Starcraft", players: 2, online: true)     
    end
    
    it "displays the developer's games' names" do
        visit "/devs/#{@nintendo.id}/games"

        expect(page).to have_content(@super_mario.name)
        expect(page).to have_content(@zelda.name)
        expect(page).to have_content(@starcraft.name)
    end

    it "displays the developer's games' player counts" do
        visit "/devs/#{@nintendo.id}/games"

        expect(page).to have_content(@super_mario.players)
        expect(page).to have_content(@zelda.players)
        expect(page).to have_content(@starcraft.players)
    end
    
    it "displays whether the develeoper's games have online play" do
        visit "/devs/#{@nintendo.id}/games"

        expect(page).to have_content(@super_mario.online?)
        expect(page).to have_content(@zelda.online?)
        expect(page).to have_content(@starcraft.online?)
    end
end
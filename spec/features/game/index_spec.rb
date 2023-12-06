require 'rails_helper'

RSpec.describe 'the games index page' do
    before(:each) do
        @nintendo = Dev.create(name: "Nintendo", employees: 40, operational: true)
        @blizzard = Dev.create(name: "Blizzard", employees: 12, operational: false)
        @super_mario = @nintendo.games.create(name: "Super Mario Bros.", players: 2, online: false)
        @zelda = @nintendo.games.create(name: "The Legend of Zelda", players: 1, online: false)
        @starcraft = @blizzard.games.create(name: "Starcraft", players: 2, online: true)     
    end
    
    it "displays the games' names" do
        visit "/games/"

        # expect(page).to have_content(@super_mario.name)
        # expect(page).to have_content(@zelda.name)
        expect(page).to have_content(@starcraft.name)
    end

    it "displays the games' developers' names" do
        visit "/games/"

        # expect(page).to have_content(@super_mario.dev.name)
        # expect(page).to have_content(@zelda.dev.name)
        expect(page).to have_content(@starcraft.dev.name)
    end

    it "displays the game player counts" do
        visit "/games/"

        # expect(page).to have_content(@super_mario.players)
        # expect(page).to have_content(@zelda.players)
        expect(page).to have_content(@starcraft.players)
    end
    
    it "displays whether the game has online play" do
        visit "/games/"

        # expect(page).to have_content(@super_mario.online?)
        # expect(page).to have_content(@zelda.online?)
        expect(page).to have_content(@starcraft.online?)
    end

    it "only lists games with online features" do
        visit "/games/"

        expect(page).to_not have_content(@zelda.online?)
        expect(page).to have_content(@starcraft.online?)
    end

    it "links to edit each game" do
        visit "/games/"
        click_link("Edit #{@starcraft.name}")

        expect(page).to have_content("Edit #{@starcraft.name}")
    end
end
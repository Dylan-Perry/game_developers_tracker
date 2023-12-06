require 'rails_helper'

RSpec.describe 'the devs show page' do
    before(:each) do
        @nintendo = Dev.create(name: "Nintendo", employees: 40, operational: true)
        @naughty_dog = Dev.create(name: "Naughty Dog", employees: 500, operational: false)
        @lil_pump = @nintendo.games.create!(name: "Lil Pump in the Big City", players: 2, online: false)
        @zelda = @nintendo.games.create!(name: "The Legend of Zelda", players: 1, online: false)
        @blonkis = @naughty_dog.games.create!(name: "Blonkis", players: 4, online: true)
    end
    
    it "displays a developer's name" do
        visit "/devs/#{@nintendo.id}"

        expect(page).to have_content(@nintendo.name)
        expect(page).to_not have_content(@naughty_dog.name)
    end

    it "displays a developer's number of employees" do
        visit "/devs/#{@nintendo.id}"

        expect(page).to have_content(@nintendo.employees)
        expect(page).to_not have_content(@naughty_dog.employees)
    end

    it "displays a developer's operational status" do
        visit "/devs/#{@nintendo.id}"

        expect(page).to have_content(@nintendo.operational?)
        expect(page).to_not have_content(@naughty_dog.operational?)
    end

    it "displays a developer's games" do
        visit "/devs/#{@nintendo.id}"

        expect(page).to have_content(@nintendo.games.find_by(name: "Lil Pump in the Big City")[:name])
        expect(page).to have_content(@nintendo.games.find_by(name: "The Legend of Zelda")[:name])
        expect(page).to_not have_content(@naughty_dog.games.find_by(name: "Blonkis")[:name])
    end

    it "displays how many games a developer has published" do
        visit "/devs/#{@nintendo.id}"
        expect(page).to have_content(@nintendo.games.count)

        visit "/devs/#{@naughty_dog.id}"
        expect(page).to have_content(@naughty_dog.games.count)
    end

    it "links to edit developer" do
        visit "/devs/#{@nintendo.id}"
        click_link("Edit Developer")

        expect(current_path).to eq("/devs/#{@nintendo.id}/edit")
    end

    it "deletes a developer" do
        visit "/devs/#{@nintendo.id}"
        click_link("Delete Developer")

        expect(current_path).to eq("/devs")
        expect(page).to_not have_content("#{@nintendo.name}")
    end

end
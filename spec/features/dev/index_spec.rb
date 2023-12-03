require 'rails_helper'

RSpec.describe 'the devs index page' do
    before(:each) do
        @nintendo = Dev.create(name: "Nintendo", employees: 40, operational: true)
        @blizzard = Dev.create(name: "Blizzard", employees: 12, operational: true)  
        @interplay = Dev.create(name: "Interplay", employees: 6, operational: false)
    end
    
    it "displays the devs' names" do
        visit "/devs/"

        expect(page).to have_content(@nintendo.name)
        expect(page).to have_content(@blizzard.name)
        expect(page).to have_content(@interplay.name)
    end

    it "displays the devs' employee counts" do
        visit "/devs/"

        expect(page).to have_content(@nintendo.employees)
        expect(page).to have_content(@blizzard.employees)
        expect(page).to have_content(@interplay.employees)
    end
    
    it "displays whether the dev studio is operational" do
        visit "/devs/"

        expect(page).to have_content(@nintendo.operational?)
        expect(page).to have_content(@blizzard.operational?)
        expect(page).to have_content(@interplay.operational?)
    end
end
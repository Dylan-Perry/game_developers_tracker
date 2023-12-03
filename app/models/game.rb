class Game < ApplicationRecord
    belongs_to :dev

    def online?
        self.online ? "Yes" : "No"
    end
end
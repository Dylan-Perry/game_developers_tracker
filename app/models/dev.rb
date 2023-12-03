class Dev < ApplicationRecord
    has_many :games

    def operational?
        self.operational ? "Yes" : "No"
    end
end
class Dev < ApplicationRecord
    has_many :songs

    def operational?
        self.operational ? "Yes" : "No"
    end
end
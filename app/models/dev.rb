class Dev < ApplicationRecord
    has_many :games, dependent: :destroy

    def operational?
        self.operational ? "Yes" : "No"
    end
end
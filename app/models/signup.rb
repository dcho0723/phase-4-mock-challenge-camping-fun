class Signup < ApplicationRecord
    belongs_to :camper
    belongs_to :activity

    validates_inclusion_of :time, in: 0..23
end

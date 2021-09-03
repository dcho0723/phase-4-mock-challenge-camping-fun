class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups

    validates_presence_of :name
    # validates_inclusion_of :age, in: 8..18
    validates :age, inclusion: { in: 8..18 }
end

class Company < ApplicationRecord
    has_many :employees
    validates :name, :presence => true
    validates :address, :presence => true
end

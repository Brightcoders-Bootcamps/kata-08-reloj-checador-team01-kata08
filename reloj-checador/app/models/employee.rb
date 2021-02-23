class Employee < ApplicationRecord
  belongs_to :company
  validates :email, :presence => true
  validates :name, :presence => true
  validates :lastname, :presence => true
  validates :position, :presence => true
  validates :private_number, :presence => true
end

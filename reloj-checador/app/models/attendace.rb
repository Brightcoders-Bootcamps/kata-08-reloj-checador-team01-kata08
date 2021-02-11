class Attendace < ApplicationRecord
  validates :private_number, presence: true

  after_create :set_check_type

  def set_check_type
    attendaces_count = Attendace.where(private_number: self.private_number).count
    if (attendaces_count > 0 && attendaces_count % 2 == 0)
      self.check_in = 0
      self.check_out = 1
    else
      self.check_in = 1
      self.check_out = 0
    end
    self.save
  end
end

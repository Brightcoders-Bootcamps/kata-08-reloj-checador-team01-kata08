class Attendace < ApplicationRecord
  validates :private_number, presence: true

  before_create :set_attendace_atts

  private

  def set_attendace_atts
    set_time_check
    set_check_type
  end

  def set_time_check
    tim = Time.new
    self.date = tim.strftime("%Y-%m-%d")
    self.time = tim.strftime("%I:%M:%S")
  end

  def set_check_type
    attendaces_count = Attendace.where(private_number: self.private_number).count
    self.check_type = (attendaces_count < 1) ? "IN" : (attendaces_count % 2 == 0) ? "IN" : "OUT"
  end
end
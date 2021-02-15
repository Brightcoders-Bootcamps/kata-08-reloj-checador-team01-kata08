class ReportsController < ApplicationController
  def att_by_day
    @attendaces = Attendace.select("count(date) AS date_count, date(date) AS created_date").group("created_date")
  end

  def avg_time_by_employees
  end

  def absence_by_month
  end
end

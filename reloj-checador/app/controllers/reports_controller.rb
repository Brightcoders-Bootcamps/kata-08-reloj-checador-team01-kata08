class ReportsController < ApplicationController
  def att_by_day
    respond_to do |format|
      format.xlsx {
        @attendaces = Attendace.att_by_day(nil, nil)
        filename = "IN-OUT por día-#{DateTime.now.strftime("%d-%m-%Y %H:%M")}.xlsx"
        response.headers["Content-Disposition"] = "attachment; filename=\"#{filename}\""
      }
      format.html {
        @attendaces = Attendace.att_by_day(params[:page], 10)
      }
    end
  end

  def avg_time_by_employees
    respond_to do |format|
      format.xlsx {
        @avg_time_by_employees = Attendace.avg_time_by_employees(nil, nil)
        filename = "IN-OUT AVG por mes-#{DateTime.now.strftime("%d-%m-%Y %H:%M")}.xlsx"
        response.headers["Content-Disposition"] = "attachment; filename=\"#{filename}\""
      }
      format.html {
        @avg_time_by_employees = Attendace.avg_time_by_employees(params[:page], 10)
      }
    end
  end

  def absence_by_month
    date = params[:date]
    respond_to do |format|
      format.xlsx {
        @abscenes, @companies = Attendace.absence_by_month(nil, nil, date)
        filename = "AUSENCIAS or mes-#{DateTime.now.strftime("%d-%m-%Y %H:%M")}.xlsx"
        response.headers["Content-Disposition"] = "attachment; filename=\"#{filename}\""
      }
      format.html {
        @abscenes, @companies = Attendace.absence_by_month(params[:page], 10, date)
      }
    end
  end
end

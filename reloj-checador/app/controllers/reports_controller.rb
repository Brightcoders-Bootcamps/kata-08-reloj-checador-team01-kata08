class ReportsController < ApplicationController
  def att_by_day
    date = params[:date]
    respond_to do |format|
      format.xlsx {
        @attendaces = Attendace.att_by_day(nil, nil, date)
        filename = "IN-OUT por día-#{DateTime.now.strftime("%d-%m-%Y %H:%M")}.xlsx"
        response.headers["Content-Disposition"] = "attachment; filename=\"#{filename}\""
      }
      format.html {
        @attendaces = Attendace.att_by_day(params[:page], 10, date)
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

  def absence_by_day
    date = params[:date]
    respond_to do |format|
      format.xlsx {
        @absences, @companies = Attendace.absence_by_day(nil, nil, date)
        filename = "AUSENCIAS por dias-#{DateTime.now.strftime("%d-%m-%Y %H:%M")}.xlsx"
        response.headers["Content-Disposition"] = "attachment; filename=\"#{filename}\""
      }
      format.html {
        @absences, @companies = Attendace.absence_by_day(params[:page], 10, date)
      }
    end
  end

  def absence_by_month
    respond_to do |format|
      format.xlsx {
        @absences = Attendace.absence_by_month(nil, nil)
        @companies = Company.all.where(id: @absences.map { |abs| abs.company_id }.sort.uniq)
        filename = "AUSENCIAS por mes-#{DateTime.now.strftime("%d-%m-%Y %H:%M")}.xlsx"
        response.headers["Content-Disposition"] = "attachment; filename=\"#{filename}\""
      }
      format.html {
        @absences = Attendace.absence_by_month(params[:page], 10)
        @companies = Company.all.where(id: @absences.map { |abs| abs.company_id }.sort.uniq)
      }
    end
  end
end

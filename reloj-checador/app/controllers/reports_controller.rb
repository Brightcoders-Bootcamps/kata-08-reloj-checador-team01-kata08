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
    # respond_to do |format|
    #   format.xlsx {
    #     @abscenes = Attendace.absence_by_month(nil, nil, date)
    #     @companies  = Employee.select("COUNT(DISTINCT employees.company_id), employees.company_id, COM.name")
    #                                   .joins("RIGHT JOIN companies COM ON employees.company_id = COM.id")
    #                                   .where(company_id: @abscenes.map { |att| att.com_id }.uniq)
    #     filename = "IN-OUT AVG por mes-#{DateTime.now.strftime("%d-%m-%Y %H:%M")}.xlsx"
    #     response.headers["Content-Disposition"] = "attachment; filename=\"#{filename}\""
    #   }
    #   format.html {
    #     @abscenes = Attendace.absence_by_month(params[:page], 1, date)
    #     @companies  = Employee.select("COUNT(DISTINCT employees.company_id), employees.company_id, COM.name")
    #                                   .joins("RIGHT JOIN companies COM ON employees.company_id = COM.id")
    #                                   .where(company_id: @abscenes.map { |att| att.com_id }.uniq)
    #                                   .group("employees.company_id, COM.id")
    #     p "@attendaces #{@abscenes.to_json}"
    #   }

    # end

    # @abscenes = Attendace.select("COUNT(DISTINCT attendaces.private_number) AS PER_DATE_COUNT, attendaces.date, COM.name, COM.id AS com_id")
    #   .joins("LEFT JOIN employees E ON attendaces.private_number = E.private_number")
    #   .joins("LEFT JOIN companies COM ON E.company_id = COM.id")
    #   .where("#{(!date.nil?) ? "attendaces.date = '#{date}'" : ""}")
    #   .group("attendaces.date, E.company_id, COM.id, COM.name, E.id, attendaces.private_number")
    #   .paginate(page: params[:page], per_page: 1)
    
    @abscenes = Attendace.where("#{(!date.nil?) ? "attendaces.date = '#{date}'" : ""}")
                         .select("attendaces.private_number, date, E.company_id, COUNT( CASE WHEN check_type = 'IN' THEN 1 END)")
                         .group("attendaces.private_number, date, E.company_id")
                         .joins("JOIN employees E ON E.private_number = attendaces.private_number")
                         .paginate(page: params[:page], per_page: 10)
    p "@abscenes.to_json #{@abscenes.to_json}"
  end
end

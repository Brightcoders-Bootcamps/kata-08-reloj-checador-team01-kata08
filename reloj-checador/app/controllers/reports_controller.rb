class ReportsController < ApplicationController
  def att_by_day
    @attendaces = Attendace.select("count(date) AS date_count, date")
                           .group("date")
                           .paginate(page: params[:page], per_page: 10)
  end

  def avg_time_by_employees
    
    sql = " SELECT  AVG_TIME_IN.mm,
                AVG_TIME_IN.yyyy,
                TO_CHAR(AVG_TIME_IN.TIME_IN,'HH12:MI:SS') AS TIME_IN,
                TO_CHAR(AVG_TIME_OUT.TIME_OUT,'HH12:MI:SS') AS TIME_OUT
            FROM
            (
              SELECT
              TO_CHAR(ATT.date, 'Mon') AS mm,
              EXTRACT(year FROM ATT.date) AS yyyy,
              AVG(ATT.time) AS TIME_IN
              FROM attendaces ATT
              WHERE ATT.check_type = 'IN'
              GROUP BY 1, 2
            )AVG_TIME_IN,
            (
              SELECT TO_CHAR(date, 'Mon') AS mm,
              EXTRACT(year FROM ATT.date) AS yyyy,
              AVG(ATT.time) AS TIME_OUT
              FROM attendaces ATT
              WHERE ATT.check_type = 'OUT'
              GROUP BY 1, 2
            )AVG_TIME_OUT
            GROUP BY
            AVG_TIME_IN.mm,  AVG_TIME_OUT.mm, AVG_TIME_IN.yyyy,  AVG_TIME_OUT.yyyy,
            AVG_TIME_IN.TIME_IN, AVG_TIME_OUT.TIME_OUT
          "
    @avg_time_by_employees = Attendace.paginate_by_sql(sql, page: params[:page], per_page: 10)
  end

  def absence_by_month
    
  end
end
class Attendace < ApplicationRecord
  validates :private_number, presence: true

  def self.att_by_day(page = nil, per_page = nil, date)
    return (page == nil && per_page == nil) ?
             Attendace.select("count(date) AS date_count, date")
                      .where("#{(!date.nil?) ? "date = '#{date}'" : ""}").group("date").order("date desc") :
             Attendace.select("count(date) AS date_count, date")
                      .where("#{(!date.nil?) ? "date = '#{date}'" : ""}").group("date").order("date desc")
                      .group("date").order("date desc").paginate(page: page, per_page: per_page)
  end

  def self.avg_time_by_employees(page = nil, per_page = nil)
    sql = "SELECT 
            AVG_TIME_IN.mm,
            AVG_TIME_IN.yyyy,
            TO_CHAR(AVG_TIME_IN.TIME_IN,'HH24:MI:SS') AS TIME_IN,
            TO_CHAR(AVG_TIME_OUT.TIME_OUT,'HH24:MI:SS') AS TIME_OUT
          FROM
          (
            SELECT
            TO_CHAR(ATT.date, 'Mon') AS mm,
            EXTRACT(year FROM ATT.date) AS yyyy,
            AVG(ATT.time) AS TIME_IN
            FROM attendaces ATT
            WHERE ATT.check_type = 'IN'
            GROUP BY 1, 2
          )AVG_TIME_IN
          LEFT JOIN
            (
              SELECT TO_CHAR(date, 'Mon') AS mm,
              EXTRACT(year FROM ATT.date) AS yyyy,
              AVG(ATT.time) AS TIME_OUT
              FROM attendaces ATT
              WHERE ATT.check_type = 'OUT'
              GROUP BY 1, 2
            )AVG_TIME_OUT
          ON AVG_TIME_IN.mm = AVG_TIME_OUT.mm
          GROUP BY
          AVG_TIME_IN.mm,  AVG_TIME_OUT.mm, AVG_TIME_IN.yyyy,  AVG_TIME_OUT.yyyy,
          AVG_TIME_IN.TIME_IN, AVG_TIME_OUT.TIME_OUT
          "
    return (page == nil && per_page == nil) ? Attendace.find_by_sql(sql) : Attendace.paginate_by_sql(sql, page: page, per_page: per_page)
  end

  def self.absence_by_day(page = nil, per_page = nil, date = nil)
    abscenes = Attendace.select("COUNT(DISTINCT E.private_number) AS emp_count, date, E.company_id")
      .joins("LEFT JOIN employees E ON attendaces.private_number = E.private_number")
      .where("check_type = 'IN' #{(!date.nil?) ? "AND attendaces.date = '#{date}'" : ""}")
      .group("E.company_id, date")
    abscenes = (page == nil && per_page == nil) ? abscenes : abscenes.paginate(page: page, per_page: per_page)
    companies = Employee.select("COUNT(DISTINCT employees.id) AS emp_count, employees.company_id, COM.name")
      .joins("RIGHT JOIN companies COM ON employees.company_id = COM.id")
      .where(company_id: abscenes.map { |att| att.company_id }.uniq)
      .group("employees.company_id, COM.id")
    return [abscenes, companies]
  end

  def self.absence_by_month(page = nil, per_page = nil)
    sql = "SELECT
            TO_CHAR(date, 'Mon') AS mm,
            EXTRACT(year FROM date) AS yyyy,
            SUM(abs_count) AS abs_count,
            SUM(emp_count) AS emp_count,
            company_id
          FROM
            (SELECT
              date,
              CASE
                WHEN E.company_id IS NOT NULL
                THEN
                  (
                    SELECT
                    (COUNT(DISTINCT EMP.id)) - COUNT(DISTINCT E.private_number)
                    FROM employees EMP
                    WHERE EMP.company_id = E.company_id
                  )
                ELSE 0
              END AS abs_count,
              COUNT(DISTINCT E.private_number) AS emp_count,
              E.company_id
            FROM attendaces
            LEFT JOIN employees E ON attendaces.private_number = E.private_number
            WHERE (check_type = 'IN' )
            GROUP BY E.company_id, date)X
            GROUP BY 1,2,company_id
            ORDER BY 1 ASC,2 DESC"
    return (page == nil && per_page == nil) ? Attendace.find_by_sql(sql) : Attendace.paginate_by_sql(sql, page: page, per_page: per_page)
  end

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

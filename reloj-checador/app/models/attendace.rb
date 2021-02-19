class Attendace < ApplicationRecord
  validates :private_number, presence: true

  def self.att_by_day(page = nil, per_page = nil)
    return (page == nil && per_page == nil) ?
             Attendace.select("count(date) AS date_count, date").group("date") :
             Attendace.select("count(date) AS date_count, date").group("date").paginate(page: page, per_page: per_page)
  end

  def self.avg_time_by_employees(page = nil, per_page = nil)
    sql = "SELECT 
            AVG_TIME_IN.mm,
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

  def self.absence_by_month(page = nil, per_page = nil, date = nil)
    p "page #{page} per_page #{per_page}"
    attendaces = Attendace.select("COUNT(DISTINCT attendaces.private_number) AS PER_DATE_COUNT, attendaces.date, COM.name, COM.id AS com_id")
                          .joins("LEFT JOIN employees E ON attendaces.private_number = E.private_number")
                          .joins("LEFT JOIN companies COM ON E.company_id = COM.id")
                          .where("#{(!date.nil?) ? "attendaces.date = '#{date}'" : ""}")
                          .group("attendaces.date, E.company_id, COM.id, COM.name, E.id, attendaces.private_number")
                          .paginate(page: page, per_page: per_page)

    return attendaces
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

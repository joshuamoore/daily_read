class Passage < ActiveRecord::Base

  scope :for_date, ->(date) {
    where([
      "read_on BETWEEN :beginning_of_day AND :end_of_day",
      { beginning_of_day: date.beginning_of_day, end_of_day: date.end_of_day }
    ])
  }
end

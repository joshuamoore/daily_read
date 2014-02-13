Time::DATE_FORMATS[:month_and_year] = "%B %Y"
Time::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize}") }

Time::DATE_FORMATS[:date_time] = '%m/%d/%Y %I:%M %p'
Time::DATE_FORMATS[:date] = '%m/%d/%Y'
Time::DATE_FORMATS[:day_number] = '%d'
Time::DATE_FORMATS[:full_day] = '%A'
Time::DATE_FORMATS[:month_number] = '%m'
Time::DATE_FORMATS[:full_month] = '%B'

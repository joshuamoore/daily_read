namespace :scrape do
  desc "Scrape current week's passages from Brook Hills Website"
  task week_passages: :environment do
    require 'open-uri'
    require 'nokogiri'

    url = "http://www.brookhills.org/gathering/this_week.html"
    doc = Nokogiri::HTML(open(url))

    this_week_div = doc.at_css("#read_through")
    this_week_table = this_week_div.at_css("table")

    1.upto(7).each do |number|
      current_information = this_week_table.css(".day#{number}")

      row_header = current_information.css("th")
      row_header.search("b").remove
      current_date_string = row_header.text.strip

      if current_date_string.present?
        current_date = Time.strptime(current_date_string, "%m/%d/%Y")

        row_column = current_information.css("td")
        current_passage_array = row_column.text.split("; ")
        current_passage_string = current_passage_array.join(", ")

        unless Passage.where(read_on: current_date).exists?
          #call to ESV API

          passage = Passage.new(
            name: current_passage_string,
            content: current_passage_string,
            read_on: current_date
          )

          if passage.valid?
            passage.save

            puts "created new passage for date #{current_date_string}"
          else
            UserMailer.failed_passage_creation(passage).deliver
          end
        end
      else
        UserMailer.failed_passage_date_format(row_column).deliver
      end
    end

    puts "done"
  end
end

class UserMailer < ActionMailer::Base
  layout 'email_template'

  default from: "DailyRead <support@dailyread.com>"

  def failed_passage_creation(passage)
    @passage = passage

    mail(to: "josh@joshmoore.org", subject: "Failed passage creation on #{Time.zone.now.to_s(:date)}")
  end

  def failed_passage_date_format(row_header)
    @row_header = row_header

    mail(to: "josh@joshmoore.org", subject: "Failed parsing passage date format on #{Time.zone.now.to_s(:date)}")
  end
end

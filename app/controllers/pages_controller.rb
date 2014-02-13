class PagesController < ApplicationController
  def index
    @passage = Passage.for_date(Time.zone.now).first
  end
end

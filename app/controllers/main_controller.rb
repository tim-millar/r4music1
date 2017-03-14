class MainController < ApplicationController
  helper :composer, :instrument, :work

  def welcome
    @composers = Composer.all.sort_by do |composer|
      [composer.last_name, composer.first_name, composer.middle_name]
    end
    @periods = Work.all_periods
    @instruments = Instrument.order(name: :asc)
  end

  def show_period
    @period = params[:id]
    @edition = Edition.of_works(works)
  end

  private

  def works
    Work.all.select do |work|
      (work.period == @period) || (work.century == @period)
    end
  end
end

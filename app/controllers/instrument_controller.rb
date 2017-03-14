class InstrumentController < ApplicationController
  helper :work, :edition

  def show
    @instrument = Instrument.find(id)
  end

  private

  def id
    params[:id]
  end
end

class EditionController < ApplicationController
  helper :composer

  def show
    @edition = Edition.find(params[:id])
  end
end

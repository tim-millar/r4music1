class MainController < ApplicationController
  def welcome
    @composers = Composer.order(:last_name, :first_name)
  end
end

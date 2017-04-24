class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'base'

  before_filter :get_customer

  def get_customer
    if session[:customer]
      @customer = Customer.find([session[:customer]])
    end
  end

  private

  def report_error(message)
    @message = message
    render('main/error')
    false
  end
end

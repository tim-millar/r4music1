class CustomerController < ApplicationController
  helper :composer

  before_filter :authorize, except: [:signup, :login]
  before_filter :new_customer, only: [:signup]

  def login
    if nick
      session[:customer] = nick.id
      redirect_to(controller: 'main', action: 'welcome')
    else
      raise Error
    end
  end

  def signup
    customer.password = Digest::SHA1.hexdigest(customer.password)
    customer.save
    session[:customer] = customer.id
    redirect_to(controller: 'main', action: 'welcome')
  end

  def authorize
    if @customer
      true
    else
      report_error('Unauthorized access. Password required.')
    end
  end

  def new_customer
    applicant = params[:customer]
    if nick
      report_error('Nick already in use.Please choose another.')
    elsif email
      report_error('Account already exists for that email address.')
    end
  end

  def view_cart
  end

  def add_to_cart
    edition = Edition.find(params[:id])
    order = Order.create(customer: @customer, edition: edition)
    if order
      redirect_to action: 'view_cart'
    else
      report_error('Trouble with saving order')
    end
  end

  def check_out
    @customer.check_out
  end

  private

  def nick
    Customer.find_by_nick(customer[:nick])
  end

  def email
    Customer.find_by_email(customer[:email])
  end

  def customer ## wrong ???
    @customer ||= Customer.new(params[:customer]) 
  end
end

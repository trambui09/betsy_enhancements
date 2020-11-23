class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :current_merchant
  before_action :current_order

  def current_merchant
    @current_merchant = Merchant.find_by(id: session[:merchant_id]) if session[:merchant_id]
  end

  def current_order
    @current_order = Order.find_by(id: session[:order_id]) if session[:order_id]
  end

  def require_login
    if @current_merchant.nil?
      flash[:error] = "You must be logged in to do that"
      redirect_to root_path
    end
  end
end

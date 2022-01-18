class ToppagesController < ApplicationController
  def index
    if logged_in?
      @offer = login_user.offers.build
      
      @pagy, @offers = pagy(login_user.offers.order(id: :desc))
    end
  end
end

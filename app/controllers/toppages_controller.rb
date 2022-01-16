class ToppagesController < ApplicationController
  def index
    if logged_in?
      @offer = login_user.offers.build
    end
    @offers = Offer.last
    # @pagy, @users = pagy(User.order(id: :desc),item: 5)
  end
end

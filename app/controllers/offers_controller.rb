class OffersController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @offers = login_user.offers.build(offer_params)
    if @offers.save
      flash[:success] = "タクシーを依頼しました。到着までしばらくお待ち下さい。"
      redirect_to root_url
    else
      @pagy, @offers = pagy(login_user.offers.order(id: :desc))
      flash[:danger] = "メッセージが送信できませんでした。"
      # render "toppages/index"
      redirect_to root_url
    end
  end
  
  private
  
  def offer_params
    params.require(:offer).permit(:offer_content)
  end
end

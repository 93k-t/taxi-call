class OffersController < ApplicationController
  def create
    @offer = login_user.offers.build(offer_params)
    if @offer.save
      flash[:success] = "タクシーを依頼しました。到着までしばらくお待ち下さい。"
      redirect_to root_url
    else
      flash.now[:danger] = "メッセージが送信できませんでした。"
      render "toppages/index"
    end
  end
  
  private
  
  def offer_params
    params.require(:offer).permit(:offer_content)
  end
end

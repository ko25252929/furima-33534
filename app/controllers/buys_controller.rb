class BuysController < ApplicationController
  before_action :set_buy, only: [:index, :create]
  before_action :authenticate_user!,only: [:index]

  

   
  def index
    @purchaseform  = PurchaseForm.new
  end

  
  
  def create
    @buy = PurchaseForm.new(buy_params)
    if @buy.valid?
       pay_item
       @buy.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_buy
    @buys = Item.find(params[:item_id])
  end

  def buy_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number ).merge(item_id: params[:item_id],user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @buys.price,  # 商品の値段
      card: buy_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end

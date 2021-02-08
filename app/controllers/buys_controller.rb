class BuysController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :sold_out_item, only: [:index, :create]

  def index
    @purchaseform = PurchaseForm.new
    redirect_to root_path if current_user == @item.user
  end

  def create
    @purchaseform = PurchaseForm.new(buy_params)
    if @purchaseform.valid?
      pay_item
      @purchaseform.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def sold_out_item
    redirect_to root_path if @item.product_purchase_history.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end


  def buy_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buy_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end

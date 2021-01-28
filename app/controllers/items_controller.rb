class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :create]

  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def update
  # current_user.update(user_params)
  # end 

  private

  def item_params
    params.require(:item).permit(:name, :price, :text, :image, :category_id, :condition_id, :cost_id, :prefectures_id,
                                 :shipping_days_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end

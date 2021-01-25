class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :create]



  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end



  private

  def
    

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end 
end
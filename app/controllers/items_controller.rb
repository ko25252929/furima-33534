class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.all
  end
end

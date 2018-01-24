class ItemsController < ApplicationController

  before_action :force_login

  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(params[:id])
  end

end

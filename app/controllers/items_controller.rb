class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity

    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :content, :price, :genre_id, :status_id, :shipping_status_id, :prefecture_id,
                                 :scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end
end

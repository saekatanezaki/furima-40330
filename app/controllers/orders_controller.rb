class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [ :index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @order = CheckOut.new
  end



  def create
    @order = CheckOut.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end



  private

    def move_to_index
    redirect_to root_path if current_user.id == @item.user_id
  end
end

  def order_params
    params.require(:check_out).permit(:price, :image, :postal_code, :prefecture_id, :city, :addresses, :building,
                                      :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = 'sk_test_95e71765b1531883075e8bd9'
    Rails.logger.debug("Token: #{order_params[:token]}")
    Rails.logger.debug("Item price: #{@item.price}")
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

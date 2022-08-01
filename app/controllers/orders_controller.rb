class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :purchased_item, only: [:index, :create]


  def index
    @order_form = OrderForm.new
    
  end

  def create
    @order_form = OrderForm.new(order_params)
    
    if @order_form.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: order_params[:token],
        currency: 'jpy' 
      )
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end
  private

  def order_params
    params.require(:order_form).permit(:postal_code, :area_id, :city, :house_number, :building_name, 
      :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

end

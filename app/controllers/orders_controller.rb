class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.all.includes(:user)
    @users = []
    @orders.each do |o|
      @users << [o.user.id, o.user.username]
    end
    @users = @users.uniq
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    if params[:email].present?
      user = User.find_by(email: params[:email])
      u = user.present? ? user : User.create(username: params[:name], email: params[:email], password: "p@ssw0rd")
      params[:user_id] = u.id
      if params[:user_id].present?
        @order = Order.new(params.require(:order).permit(:phone, :address, :delivery_date, :item_id, :payment_option, :amount, :order_status, :user_id))
        if @order.save
          redirect_to orders_path, :notice => "Order was successfully created."
        else
          redirect_to new_order_path, :alert => "Something went wrong! Please try again"
        end
      else
        redirect_to new_order_path, :alert => "Something went wrong! Please try again"
      end
    else
      redirect_to new_order_path, :alert => "Please fill email ID column"
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    is_status_change = (@order.order_status != params["status"])
    if @order.update(params.require(:order).permit(:phone, :address, :delivery_date, :item_id, :payment_option, :amount, :order_status))
      AlertsMailer.send_alert(User.find(@order.user_id), @order).deliver_now! if is_status_change
      redirect_to orders_path, :notice => "Order was successfully updated."
    else
      redirect_to edit_order_path(params[:id]), :alert => "Something went wrong! Please try again"
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      redirect_to orders_path, :notice => "Order was successfully deleted."
    else
      redirect_to orders_path, :alert => "Something went wrong! Please try again"
    end
  end
end

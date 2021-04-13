class AlertsMailer < ApplicationMailer
  default from: "ordersystem45@gmail.com"

  def send_alert(user, order)
    @user = user
    @order = order
    mail(:to => @user.email, :subject => "Your order #{@order.order_status}")
  end
end

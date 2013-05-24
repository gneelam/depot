class Notifier < ActionMailer::Base
  default from: "Priyank Gupta <pinkmaniya@gmail.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received(order)
    @order = order

    mail to: order.email, :subject => 'Priyank Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped(order)
    @order = order

    mail to: order.email, :subject => 'Priyank Store Order Shipped'
  end
end

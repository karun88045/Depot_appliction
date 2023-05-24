class OrderMailer < ApplicationMailer
  default from: 'Sam Ruby <depot@example.com>'

  def welcome_email(order)
    @order = order
    mail(to: @order.email, subject: 'Welcome to My App')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def received(order)
    # @greeting = "Hi"

    # mail to: "to@example.org"
    @order = order
    @order_count = order.class.count
    mail to: @order.email, subject: 'Pragmatic Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
  def shipped(order)
    # @greeting = "Hi"

    # mail to: "to@example.org"
    @order = order
    @order_count = order.class.count
    mail to: @order.email, subject: 'Pragmatic Store Order Shipped'
  end
end

require "test_helper"

class ProductsChannelTest < ActionCable::Channel::TestCase
  # test "subscribes" do
  #   subscribe
  #   assert subscription.confirmed?
  # end
  def subscribed
    stream_from "products"
  end

  def unsubscribed
  # Any cleanup needed when channel is unsubscribed
  end
end

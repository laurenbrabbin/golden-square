require 'twilio-ruby'

class ConfirmOrder
  def initialize(number)
    @mobile_number = number
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV["TWILIO_AUTH_TOKEN"])
  end

  
  def send_text
    @client.messages.create(
      to: @mobile_number, #customer phone number
      from: '+12283008773', #random twilio test number
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    )
  end
  
  private
  def delivery_time
    (Time.now + 60 * 60).strftime("%H:%M")
  end
end



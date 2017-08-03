class OrderMailer < ApplicationMailer
	def order_send(order)
		mail to: order.email, subject: "Theatr Order Confirmation", from: "info@theatr.com"
	end
end

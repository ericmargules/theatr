class Order < ApplicationRecord
  belongs_to :showtime
  after_create :order_send

  private

  def order_send
  	OrderMailer.order_send(self).deliver
  end
end

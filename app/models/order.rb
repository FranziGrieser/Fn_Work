class Order < ApplicationRecord
  belongs_to :order_status, :user
  has_many :order_items
  before_create :set_order_status
  before_save :update_total

  def total
    order_items.collect { |oi| oi.valid? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  private
    def set_order_status
      self.order_status.id = 1
    end

    def update_total
      self[:total] = total
    end
end

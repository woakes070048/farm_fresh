class Order < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :delivery_option
  belongs_to :status

  has_many :line_items
  has_many :items, through: :line_items

  validates_presence_of :restaurant, :delivery_option, :status
  validate :status, :set_default_status

  before_update :calculate_total
  before_create :calculate_total
  before_destroy :check_status

  private

  def calculate_total
    self.total_ex_vat =
      line_items.inject(0) do |sum, line_item|
        sum + (line_item.item.price * line_item.quantity)
      end
  end

  def set_default_status
    self.status ||= Status.find_by(name: "In Progress")
  end

  def check_status
    if self.status.name == "In Progress"
      self.line_items.destroy_all
      true
    else
      false
    end
  end
end

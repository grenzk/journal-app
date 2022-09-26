class LineItem < ApplicationRecord
  belongs_to :line_item_date

  validates :name, presence: true
  delegate :category, to: :line_item_date
end

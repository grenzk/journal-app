class LineItemDate < ApplicationRecord
  belongs_to :category

  validates :date, presence: true, uniqueness: { scope: :category_id }
  scope :ordered, -> { order(date: :asc) }

  def previous_date
    category.line_item_dates.ordered.where('date < ?', date).last
  end
end

class LineItemDate < ApplicationRecord
  belongs_to :category

  validates :date, presence: true, uniqueness: { scope: :category_id }
  scope :ordered, -> { order(date: :asc) }
end

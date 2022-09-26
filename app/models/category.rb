class Category < ApplicationRecord
  belongs_to :admin
  has_many :line_item_dates, dependent: :destroy
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }
  # after_create_commit -> { broadcast_prepend_later_to 'categories' }
  # after_update_commit -> { broadcast_replace_later_to 'categories' }
  # after_destroy_commit -> { broadcast_remove_to 'categories' }
  broadcasts_to ->(category) { [category.admin, 'categories'] },
                inserts_by: :prepend
end

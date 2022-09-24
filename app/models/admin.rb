class Admin < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: true
end

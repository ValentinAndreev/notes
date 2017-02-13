class Plan < ApplicationRecord
  include RankedModel
  ranks :row_order
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end

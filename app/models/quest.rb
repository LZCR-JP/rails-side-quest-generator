class Quest < ApplicationRecord
  has_many :completions, dependent: :destroy

  validates :title, :description, :category, :difficulty, presence: true
  validates :duration_minutes, numericality: { only_integer: true, greater_than: 0 }
end

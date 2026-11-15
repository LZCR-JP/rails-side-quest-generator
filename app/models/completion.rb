class Completion < ApplicationRecord
  belongs_to :quest

  validates :rating, numericality: { only_integer: true, in: 1..5 }, allow_nil: true
end

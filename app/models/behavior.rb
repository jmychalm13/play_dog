class Behavior < ApplicationRecord
  belongs_to :dog

  PREDEFINED_BEHAVIORS = ["Playful", "Happy", "Reactive", "Calm", "Nervous"]

  validates :behavior, inclusion: { in: PREDEFINED_BEHAVIORS }
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end

class Behavior < ApplicationRecord
  belongs_to :dog
  validates :behavior, uniqueness: { scope: :dog_id, message: "this behavior has already been adding to this dog" }
end

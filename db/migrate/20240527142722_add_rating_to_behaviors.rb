class AddRatingToBehaviors < ActiveRecord::Migration[7.0]
  def change
    add_column :behaviors, :rating, :integer
  end
end

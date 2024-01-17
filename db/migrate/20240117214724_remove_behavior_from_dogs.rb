class RemoveBehaviorFromDogs < ActiveRecord::Migration[7.0]
  def change
    remove_column :dogs, :behavior, :string
  end
end

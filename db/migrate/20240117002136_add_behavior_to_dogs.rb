class AddBehaviorToDogs < ActiveRecord::Migration[7.0]
  def change
    add_column :dogs, :behavior, :string
  end
end

class AddUniqueConstrainToBehaviors < ActiveRecord::Migration[7.0]
  def change
    add_index  :behaviors, [:dog_id, :behavior], unique: true
  end
end

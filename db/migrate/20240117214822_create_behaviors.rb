class CreateBehaviors < ActiveRecord::Migration[7.0]
  def change
    create_table :behaviors do |t|
      t.integer :dog_id
      t.string :behavior

      t.timestamps
    end
  end
end

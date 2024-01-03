class CreatePlaydates < ActiveRecord::Migration[7.0]
  def change
    create_table :playdates do |t|
      t.string :location
      t.datetime :time
      t.integer :user_id

      t.timestamps
    end
  end
end

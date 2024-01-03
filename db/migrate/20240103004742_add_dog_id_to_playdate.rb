class AddDogIdToPlaydate < ActiveRecord::Migration[7.0]
  def change
    add_column :playdates, :dog_id, :integer
  end
end

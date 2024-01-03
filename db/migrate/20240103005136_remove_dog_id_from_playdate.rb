class RemoveDogIdFromPlaydate < ActiveRecord::Migration[7.0]
  def change
    remove_column :playdates, :dog_id, :integer 
  end
end

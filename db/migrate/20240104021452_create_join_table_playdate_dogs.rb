class CreateJoinTablePlaydateDogs < ActiveRecord::Migration[7.0]
  def change
    create_join_table :playdates, :dogs do |t|
      # t.index [:playdate_id, :dog_id]
      # t.index [:dog_id, :playdate_id]
    end
  end
end

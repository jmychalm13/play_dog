class AddImageUrlToDogs < ActiveRecord::Migration[7.0]
  def change
    add_column :dogs, :image_url, :string
  end
end

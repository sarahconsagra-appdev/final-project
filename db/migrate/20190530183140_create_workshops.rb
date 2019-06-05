class CreateWorkshops < ActiveRecord::Migration[5.1]
  def change
    create_table :workshops do |t|
      t.string :title
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.float :price
      t.integer :provider_id
      t.string :image
      t.integer :capacity
      t.string :location
      t.text :reviews

      t.timestamps
    end
  end
end

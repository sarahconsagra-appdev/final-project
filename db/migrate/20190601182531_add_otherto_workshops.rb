class AddOthertoWorkshops < ActiveRecord::Migration[5.1]
  def change
  add_column :workshops, :other, :string
  end
end

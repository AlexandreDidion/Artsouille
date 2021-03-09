class AddNewColumnsToExhibitions < ActiveRecord::Migration[6.0]
  def change
    add_column :exhibitions, :city, :string
    add_column :exhibitions, :country, :string
  end
end

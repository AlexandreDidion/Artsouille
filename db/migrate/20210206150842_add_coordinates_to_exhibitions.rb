class AddCoordinatesToExhibitions < ActiveRecord::Migration[6.0]
  def change
    add_column :exhibitions, :latitude, :float
    add_column :exhibitions, :longitude, :float
  end
end

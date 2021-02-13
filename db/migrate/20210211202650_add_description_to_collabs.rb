class AddDescriptionToCollabs < ActiveRecord::Migration[6.0]
  def change
    add_column :collabs, :description, :text
  end
end

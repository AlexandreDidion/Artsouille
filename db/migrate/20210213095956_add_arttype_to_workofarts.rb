class AddArttypeToWorkofarts < ActiveRecord::Migration[6.0]
  def change
    add_column :work_of_arts, :art_type, :string
  end
end

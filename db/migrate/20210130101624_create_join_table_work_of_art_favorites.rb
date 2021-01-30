class CreateJoinTableWorkOfArtFavorites < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :work_of_arts do |t|
      # t.index [:user_id, :work_of_art_id]
      # t.index [:work_of_art_id, :user_id]
    end
  end
end

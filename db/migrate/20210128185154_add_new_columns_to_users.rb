class AddNewColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :art_type, :string
    add_column :users, :description, :text
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :birthday, :date
  end
end

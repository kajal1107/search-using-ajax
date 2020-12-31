class AddColumnToAddress < ActiveRecord::Migration[6.1]
  def change
  	add_column :addresses, :address, :string
  	add_column :addresses, :street_number, :integer
  	add_column :addresses, :locality, :string
  	add_column :addresses, :route, :string
  	add_column :addresses, :administrative_area_level_1, :string
  	add_column :addresses, :country, :string
  	add_column :addresses, :postal_code, :integer
  end
end

class RemoveColumnFromAddress < ActiveRecord::Migration[6.1]
  def change
  	remove_column :addresses, :street, :string
  	remove_column :addresses, :city,   :string
  	remove_column :addresses, :state,  :string
  	remove_column :addresses, :pin,    :integer
  end
end

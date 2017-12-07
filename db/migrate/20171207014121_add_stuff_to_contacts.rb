class AddStuffToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :first_name, :string
    add_column :contacts, :last_name, :string
    add_column :contacts, :phone_number, :string
    add_column :contacts, :email, :string
  end
end

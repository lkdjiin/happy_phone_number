class AddPhone2ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :phone2, :string
  end
end

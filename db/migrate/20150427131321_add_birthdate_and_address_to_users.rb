class AddBirthdateAndAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :date
    add_column :users, :address, :text

  end
end

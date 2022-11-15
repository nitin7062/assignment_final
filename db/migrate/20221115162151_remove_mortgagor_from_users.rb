class RemoveMortgagorFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :Mortgagor, :boolean
  end
end

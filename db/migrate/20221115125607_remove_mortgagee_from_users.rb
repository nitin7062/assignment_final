class RemoveMortgageeFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :Mortgagee, :boolean
  end
end

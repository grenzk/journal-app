class AddAdminReferenceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :admin, null: false, foreign_key: true
  end
end

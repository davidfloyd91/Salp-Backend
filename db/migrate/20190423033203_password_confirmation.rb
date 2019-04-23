class PasswordConfirmation < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :confirmation, :password_confirmation
  end
end

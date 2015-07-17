class ChangeReferencesTable < ActiveRecord::Migration
  def change
    remove_column :references, :url
    add_column :references, :email, :string
  end
end

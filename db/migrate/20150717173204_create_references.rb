class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.column :name, :string
      t.column :url, :string
    end
  end
end

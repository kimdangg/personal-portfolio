class AddImageToProject < ActiveRecord::Migration
  def change
      add_column(:projects, :preview_image, :string)
  end
end

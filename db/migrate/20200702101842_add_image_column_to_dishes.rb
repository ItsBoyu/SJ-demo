class AddImageColumnToDishes < ActiveRecord::Migration[6.0]
  def change
    add_column :dishes, :img_url, :string
  end
end

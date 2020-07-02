class AddPeriodToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :period, :integer, default: 0, null: false
  end
end

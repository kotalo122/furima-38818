class RenameBuildingColumnToShipments < ActiveRecord::Migration[6.0]
  def change
    rename_column :shipments, :building, :building_name
  end
end

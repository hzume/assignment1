class RenameValueColumnToMicropost < ActiveRecord::Migration[5.1]
  def change
    rename_column :Microposts, :value, :rating
  end
end

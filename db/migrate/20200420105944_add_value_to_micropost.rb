class AddValueToMicropost < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :value, :integer
  end
end

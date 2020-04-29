class AddDetailToMicropost < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :title, :string
    add_column :microposts, :year, :integer
    add_column :microposts, :month, :integer
    add_column :microposts, :date, :integer
    add_column :microposts, :theater, :string
    add_column :microposts, :rating, :integer
  end
end

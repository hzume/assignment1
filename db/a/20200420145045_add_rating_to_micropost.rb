class AddRatingToMicropost < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :rating, :integer
  end
end

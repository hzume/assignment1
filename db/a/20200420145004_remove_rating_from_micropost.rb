class RemoveRatingFromMicropost < ActiveRecord::Migration[5.1]
  def change
    remove_column :microposts, :rating, :integer
  end
end

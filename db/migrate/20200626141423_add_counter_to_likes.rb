class AddCounterToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :counter, :integer
  end
end

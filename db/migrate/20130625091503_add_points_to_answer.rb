class AddPointsToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :points, :integer
  end
end

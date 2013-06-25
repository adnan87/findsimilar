class RemoveColNameFromAnswers < ActiveRecord::Migration
  def up
    remove_column :answers, :name
  end

  def down
  
  end
end

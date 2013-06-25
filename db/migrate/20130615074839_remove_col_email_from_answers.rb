class RemoveColEmailFromAnswers < ActiveRecord::Migration
  def up
    remove_column :answers, :email
  end

  def down
 
  end
end

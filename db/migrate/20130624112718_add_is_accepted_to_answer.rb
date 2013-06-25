class AddIsAcceptedToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :is_accepted, :boolean
  end
end

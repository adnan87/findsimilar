class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.string :name
      t.string :email
      t.string :url
      t.float :price
      t.text :comment

      t.timestamps
    end
  end
end

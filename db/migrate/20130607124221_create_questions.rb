class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :question
      t.text :description
      t.string :image
      t.float :price
      t.string :url

      t.timestamps
    end
  end
end

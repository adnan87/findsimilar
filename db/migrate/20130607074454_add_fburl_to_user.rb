class AddFburlToUser < ActiveRecord::Migration
  def change
    add_column :users, :fb_url, :string
  end
end

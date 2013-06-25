class RenameVoteTypeToIsVote < ActiveRecord::Migration
  def up
  	rename_column :votes, :vote_type, :is_vote
  end

  def down
  end
end

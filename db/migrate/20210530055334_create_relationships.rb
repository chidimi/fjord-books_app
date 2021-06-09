# frozen_string_literal: true

class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.references :follower, foreign_key: { to_table: :users }, null: false
      t.references :followee, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
    add_index :relationships, %i[follower_id followee_id], unique: true
  end
end

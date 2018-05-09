class CreateActivityParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_participants do |t|
      t.references :activity, foreign_key: true
      t.boolean :is_join
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

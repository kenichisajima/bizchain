class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.references :user, foreign_key: {on_delete: :cascade}
      t.references :meeting, foreign_key: {on_delete: :cascade}

      t.timestamps
      
      t.index [:user_id, :meeting_id], unique: true
    end
  end
end

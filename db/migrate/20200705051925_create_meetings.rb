class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :place
      t.datetime :start_from
      t.string :content

      t.timestamps
    end
  end
end

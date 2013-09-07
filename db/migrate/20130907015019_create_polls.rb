class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :question
      t.references :event

      t.timestamps
    end

		add_index :polls, :event_id

  end
end

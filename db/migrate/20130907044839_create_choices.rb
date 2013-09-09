class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :name
			t.integer :votes
      t.references :poll

      t.timestamps
    end

		add_index :choices, :poll_id

  end
end

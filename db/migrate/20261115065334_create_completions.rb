class CreateCompletions < ActiveRecord::Migration[8.1]
  def change
    create_table :completions do |t|
      t.datetime :completed_at
      t.text :note
      t.integer :rating
      t.references :quest, null: false, foreign_key: true

      t.timestamps
    end
  end
end

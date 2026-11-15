class CreateQuests < ActiveRecord::Migration[8.1]
  def change
    create_table :quests do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :difficulty
      t.integer :duration_minutes

      t.timestamps
    end
  end
end

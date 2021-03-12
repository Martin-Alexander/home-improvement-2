class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string  :title,                     null: :false
      t.text    :description,               null: :false
      t.string  :status,                    null: :false
      t.boolean :private,                   null: :false, default: false
      t.integer :estimated_level_of_effort, null: :false
      t.integer :actual_level_of_effort,    null: :false

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

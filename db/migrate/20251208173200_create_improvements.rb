class CreateImprovements < ActiveRecord::Migration[7.1]
  def change
    create_table :improvements do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.references :classification, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :todo, foreign_key: true
      t.text :text
      t.integer :author_id

      t.timestamps
    end
  end
end

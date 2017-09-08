class CreateAnnounceUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :announce_users do |t|
      t.belongs_to :announce, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end

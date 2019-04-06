class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits, id: :uuid do |t|
      t.string :guid, null: false
      t.string :url, null: false
      t.datetime :accessed_at, null: false

      t.timestamps
    end

    add_index :visits, :guid, unique: true
  end
end

class FixVisitsIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :visits, :guid
    add_index :visits, :guid
  end
end

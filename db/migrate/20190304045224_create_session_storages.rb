class CreateSessionStorages < ActiveRecord::Migration[5.2]
  def change
    create_table :session_storages do |t|

      t.timestamps
    end
  end
end

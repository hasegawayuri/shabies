class CreateGpins < ActiveRecord::Migration[6.1]
  def change
    create_table :gpins do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end

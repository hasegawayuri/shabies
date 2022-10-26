class CreateUserrooms < ActiveRecord::Migration[6.1]
  def change
    create_table :userrooms do |t|
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end

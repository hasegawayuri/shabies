class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.binary :icon
      t.string :groupname
      t.integer :classification_id
      t.integer :limit
      t.integer :user_id
      t.text :introduction

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.date :joining_date
      t.string :contact_no

      t.timestamps
    end
  end
end

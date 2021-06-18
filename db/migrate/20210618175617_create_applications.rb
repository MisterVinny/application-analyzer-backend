class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.integer :user_id
      t.string :employer
      t.string :address
      t.string :position
      t.string :date
      t.string :contact
      t.string :email
      t.boolean :followup
      t.string :method
      t.integer :interviews
      t.string :status
      t.integer :enthusiasm
      t.integer :confidence
      t.text :notes

      t.timestamps
    end
  end
end

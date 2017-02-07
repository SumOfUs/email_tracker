class CreateOpens < ActiveRecord::Migration[5.0]
  def change
    create_table :opens do |t|
      t.references:campaign
      t.string :recipient_id
      t.datetime :first_opened_at
      t.datetime :last_opened_at
      t.integer :opens_count, default: 0

      t.timestamps
    end
  end
end

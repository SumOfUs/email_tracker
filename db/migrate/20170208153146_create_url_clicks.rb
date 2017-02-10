class CreateUrlClicks < ActiveRecord::Migration[5.0]
  def change
    create_table :url_clicks do |t|
      t.string :url
      t.datetime :first_clicked_at
      t.datetime :last_clicked_at
      t.string :recipient_id
      t.integer :clicks_count, default: 0
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end

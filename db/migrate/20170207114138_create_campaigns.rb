class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :uid
      t.integer :opens_count, default: 0

      t.timestamps
    end
  end
end

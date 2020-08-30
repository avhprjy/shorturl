class CreateShortendUrlStats < ActiveRecord::Migration[6.0]
  def change
    create_table :shortend_url_stats do |t|
      t.string :ip
      t.string :country
      t.integer :shortend_url_id

      t.timestamps
    end
  end
end

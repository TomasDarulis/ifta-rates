class CreateIftaRates < ActiveRecord::Migration[6.1]
  def change
    create_table :ifta_rates do |t|
      t.integer :year, default: 0
      t.integer :quarter, default: 0
      t.string :status, default: ""
      t.jsonb :rates, default: {}
      t.string :error, default: ""
      t.timestamps
    end
  end
end

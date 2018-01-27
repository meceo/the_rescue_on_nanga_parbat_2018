class CreateStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      t.datetime :recorded_at
      t.string :identifier
      t.json :data
    end
  end
end

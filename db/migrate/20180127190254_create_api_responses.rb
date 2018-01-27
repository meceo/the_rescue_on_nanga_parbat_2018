class CreateApiResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :api_responses do |t|
      t.integer :code
      t.text :body
      t.text :headers
      t.string :message
    end
  end
end

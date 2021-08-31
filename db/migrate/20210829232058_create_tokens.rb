class CreateTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :tokens do |t|
      t.string :key, :limit => 8 , :null => false
      t.string :aasm_state

      t.timestamps
    end
  end
end

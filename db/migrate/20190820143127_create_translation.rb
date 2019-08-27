class CreateTranslation < ActiveRecord::Migration[6.0]
  def change
    create_table :translations do |t|
      t.integer :section_id, null: false
    end
  end
end

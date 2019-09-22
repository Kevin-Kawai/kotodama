class AddTranslatableToTranslations < ActiveRecord::Migration[6.0]
  def change
    add_column :translations, :translatable_id, :integer
    add_column :translations, :translatable_type, :string
  end
end

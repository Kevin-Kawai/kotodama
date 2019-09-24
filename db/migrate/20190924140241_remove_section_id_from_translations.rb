class RemoveSectionIdFromTranslations < ActiveRecord::Migration[6.0]
  def change
    remove_column :translations, :section_id
  end
end

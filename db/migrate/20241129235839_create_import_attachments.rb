class CreateImportAttachments < ActiveRecord::Migration[8.0]
  def change
    create_table :import_attachments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :subject

      t.timestamps
    end
  end
end

class CreateSeoMetaContents < ActiveRecord::Migration
  def change
    create_table :seo_meta_contents do |t|
      t.integer :resource_id
      t.string :resource_type
      t.string :meta_title
      t.text :meta_description
      t.text :meta_keywords

      t.timestamps
    end
  end
end

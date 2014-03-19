class CreateSeoPermanentRedirects < ActiveRecord::Migration
  def change
    create_table :seo_permanent_redirects do |t|
      t.integer :origin_id
      t.integer :destination_id

      t.timestamps
    end
  end
end

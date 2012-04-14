class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :description
      t.string :email
      t.string :url
      t.string :twitter
      t.timestamps
    end
  end
end

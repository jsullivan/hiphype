class AddHackathonToApps < ActiveRecord::Migration
  def self.up
    add_column :apps, :event, :string
  end

  def self.down
    drop_column :apps, :event
  end
end

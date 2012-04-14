class AddAvatarToApp < ActiveRecord::Migration
   def self.up
    change_table :apps do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :apps, :avatar
  end
end

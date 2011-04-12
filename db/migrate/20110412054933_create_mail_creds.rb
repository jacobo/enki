class CreateMailCreds < ActiveRecord::Migration
  def self.up
    create_table :mail_creds do |t|
      t.string   "user_name"
      t.string   "password"
      t.timestamps
    end
  end

  def self.down
    drop_table :mail_creds
  end
end

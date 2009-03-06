class CreateAuthorizedUsers < ActiveRecord::Migration
  def self.up
    create_table :authorized_users do |t|
      t.string   "username"
      t.string   "password_hash"
      t.timestamps
    end
  end

  def self.down
    drop_table :authorized_users
  end
end

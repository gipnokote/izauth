class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.references :user
      t.string :sign_in_ip
      t.datetime :sign_in_at
    end
  end
end

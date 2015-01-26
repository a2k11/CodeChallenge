class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter, :string, null: false, default: "Twitter"
    add_column :users, :github, :string, null: false, default: "Github"
    add_column :users, :email, :string, null: false, default: "user@email.com"
  end
end

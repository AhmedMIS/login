class UserType < ActiveRecord::Migration[5.1]
  def change
    create_table :users_type do |t|
  t.string :user_type,              null: false, default: ""

      end
  end
end

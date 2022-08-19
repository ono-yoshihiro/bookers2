class RemoveIntroductiFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :introducti, :text
  end
end

class AddUserIdtoTasks < ActiveRecord::Migration[5.2]
  def up
     execute 'DELETE FROM tasks;'
     add_reference :tasks, :user, null: false, index: true
  end

  def down
    remove_referrence :tasks, :user, index: true
  end
  
end

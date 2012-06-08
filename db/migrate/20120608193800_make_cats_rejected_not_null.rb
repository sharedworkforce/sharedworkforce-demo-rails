class MakeCatsRejectedNotNull < ActiveRecord::Migration
  def change
  	Cat.update_all(['rejected=?', false], 'rejected IS NULL')
  	change_column :cats, :rejected, :boolean, :null=>false, :default=>false
  end
end

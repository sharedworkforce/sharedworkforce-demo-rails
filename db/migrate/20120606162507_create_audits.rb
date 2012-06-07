class CreateAudits < ActiveRecord::Migration
  def change
  	create_table :audits do |t|
  		t.integer :cat_id
  		t.text :comment

  		t.timestamps
  	end

  	add_index :audits, :cat_id
  end
end

class AddNotificationEmailToCats < ActiveRecord::Migration
  def change
  	add_column :cats, :notification_email, :string
  end
end

class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :time
      t.string :customer_id
      t.integer :user_id
    end
  end
end

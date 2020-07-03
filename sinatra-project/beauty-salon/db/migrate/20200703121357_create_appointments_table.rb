class CreateAppointmentsTable < ActiveRecord::Migration
  def change
    create_table :appointments do|t|
      t.belongs_to :user
      t.belongs_to :customer
      t.datetime :appointment_date
    end
  end
end

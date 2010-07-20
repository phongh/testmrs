class CreatePatientVieweds < ActiveRecord::Migration
  def self.up
    create_table :patient_vieweds do |t|
      t.integer :user_id
      t.integer :patient_id

      t.timestamps
    end
  end

  def self.down
    drop_table :patient_vieweds
  end
end

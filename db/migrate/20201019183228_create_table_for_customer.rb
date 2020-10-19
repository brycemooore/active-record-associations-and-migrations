class CreateTableForCustomer < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :given_name
      t.string :family_name
    end
  end
end

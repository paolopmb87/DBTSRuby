class CreateMedicines < ActiveRecord::Migration[5.1]
  def change
    create_table :medicines, id: false do |t|
      t.decimal :medicine_id, precision:25, scale:0
      t.string :medicine_name
    end

    execute "alter table medicines add primary key (medicine_id);"
    execute "alter table medicines modify medicine_id int auto_increment;"

    Medicine.create medicine_name: 'Karvea'
    Medicine.create medicine_name: 'Torvast'
    Medicine.create medicine_name: 'Glucophage'
    Medicine.create medicine_name: 'Janumet'


  end
end

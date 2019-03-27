class CreateMedics < ActiveRecord::Migration[5.1]
  def change
    create_table :medics, id: false do |t|
      t.integer :medic_id
      t.string :medic_name
      t.string :medic_mail
      t.string :medic_hospital
      t.timestamps
    end
    execute "alter table medics add primary key (medic_id);"
    add_foreign_key :users, :medics, column: :medic_id, primary_key: "medic_id"

    Medic.create medic_id: '1', medic_name: 'Donald Duck', medic_mail: 'DonaldD@gmail.com', medic_hospital: 'Paperospital'
    Medic.create medic_id: '2', medic_name: 'Goofy', medic_mail: 'Goofy@gmail.com', medic_hospital: 'Goofospital'
    Medic.create medic_id: '3', medic_name: 'Mickey Mouse', medic_mail: 'Mickey@gmail.com', medic_hospital: 'Topospital'
    Medic.create medic_id: '4', medic_name: 'Scrooge McDuck', medic_mail: 'Scrooge@gmail.com', medic_hospital: 'ScroogeHospital'
  end
end

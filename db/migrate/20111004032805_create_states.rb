# encoding: utf-8
class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :nombre

      t.timestamps
    end
    
     State.create :nombre => "AGUASCALIENTES"
  	State.create :nombre => "BAJA CALIFORNIA"
  	State.create :nombre => "BAJA CALIFORNIA SUR"
  	State.create :nombre => "CAMPECHE"
  	State.create :nombre => "COAHUILA DE ZARAGOZA"
  	State.create :nombre => "COLIMA"
  	State.create :nombre => "CHIAPAS"
  	State.create :nombre => "CHIHUAHUA"
  	State.create :nombre => "DISTRITO FEDERAL"
  	State.create :nombre => "DURANGO"
  	State.create :nombre => "GUANAJUATO"
  	State.create :nombre => "GUERRERO"
  	State.create :nombre => "HIDALGO"
  	State.create :nombre => "JALISCO"
  	State.create :nombre => "State DE MEXICO"
  	State.create :nombre => "MICHOACAN"
  	State.create :nombre => "MORELOS"
  	State.create :nombre => "NAYARIT"
  	State.create :nombre => "NUEVO LEON"
  	State.create :nombre => "OAXACA"
  	State.create :nombre => "PUEBLA"
  	State.create :nombre => "QUERETARO DE ARTEAGA"
  	State.create :nombre => "QUINTANA ROO"
  	State.create :nombre => "SAN LUIS POTOSI"
  	State.create :nombre => "SINALOA"
  	State.create :nombre => "SONORA"
  	State.create :nombre => "TABASCO"
  	State.create :nombre => "TAMAULIPAS"
  	State.create :nombre => "TLAXCALA"
  	State.create :nombre => "VERACRUZ LLAVE"
  	State.create :nombre => "YUCATAN"
  	State.create :nombre => "ZACATECAS"
  	
  end
end

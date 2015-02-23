# encoding: utf-8
class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :nombre
      t.integer :state_id

      t.timestamps
    end
    
    City.create :nombre => "ACONCHI", :state_id=> 26
  	City.create :nombre => "AGUA PRIETA", :state_id=> 26
  	City.create :nombre => "ALAMOS", :state_id=> 26
  	City.create :nombre => "ALTAR", :state_id=> 26
  	City.create :nombre => "ARIVECHI", :state_id=> 26
  	City.create :nombre => "ARIZPE", :state_id=> 26
  	City.create :nombre => "ATIL", :state_id=> 26
  	City.create :nombre => "BACADEHUACHI", :state_id=> 26
  	City.create :nombre => "BACANORA", :state_id=> 26
  	City.create :nombre => "BACERAC", :state_id=> 26
  	City.create :nombre => "BACOACHI", :state_id=> 26
  	City.create :nombre => "BACUM", :state_id=> 26
  	City.create :nombre => "BANAMICHI", :state_id=> 26
  	City.create :nombre => "BAVIACORA", :state_id=> 26
  	City.create :nombre => "BAVISPE", :state_id=> 26
  	City.create :nombre => "BENJAMIN HILL", :state_id=> 26
  	City.create :nombre => "CABORCA", :state_id=> 26
  	City.create :nombre => "CAJEME", :state_id=> 26
  	City.create :nombre => "CANANEA", :state_id=> 26
  	City.create :nombre => "CARBO", :state_id=> 26
  	City.create :nombre => "LA COLORADA", :state_id=> 26
  	City.create :nombre => "CUCURPE", :state_id=> 26
  	City.create :nombre => "CUMPAS", :state_id=> 26
  	City.create :nombre => "DIVISADEROS", :state_id=> 26
  	City.create :nombre => "EMPALME", :state_id=> 26
  	City.create :nombre => "ETCHOJOA", :state_id=> 26
  	City.create :nombre => "FRONTERAS", :state_id=> 26
  	City.create :nombre => "GRANADOS", :state_id=> 26
  	City.create :nombre => "GUAYMAS", :state_id=> 26
  	City.create :nombre => "HERMOSILLO", :state_id=> 26
  	City.create :nombre => "HUACHINERA", :state_id=> 26
  	City.create :nombre => "HUASABAS", :state_id=> 26
  	City.create :nombre => "HUATABAMPO", :state_id=> 26
  	City.create :nombre => "HUEPAC", :state_id=> 26
  	City.create :nombre => "IMURIS", :state_id=> 26
  	City.create :nombre => "MAGDALENA", :state_id=> 26
  	City.create :nombre => "MAZATAN", :state_id=> 26
  	City.create :nombre => "MOCTEZUMA", :state_id=> 26
  	City.create :nombre => "NACO", :state_id=> 26
  	City.create :nombre => "NACORI CHICO", :state_id=> 26
  	City.create :nombre => "NACOZARI DE GARCIA", :state_id=> 26
  	City.create :nombre => "NAVOJOA", :state_id=> 26
  	City.create :nombre => "NOGALES", :state_id=> 26
  	City.create :nombre => "ONAVAS", :state_id=> 26
  	City.create :nombre => "OPODEPE", :state_id=> 26
  	City.create :nombre => "OQUITOA", :state_id=> 26
  	City.create :nombre => "PITIQUITO", :state_id=> 26
  	City.create :nombre => "PUERTO PEÑASCO", :state_id=> 26
  	City.create :nombre => "QUIRIEGO", :state_id=> 26
  	City.create :nombre => "RAYON", :state_id=> 26
  	City.create :nombre => "ROSARIO", :state_id=> 26
  	City.create :nombre => "SAHUARIPA", :state_id=> 26
  	City.create :nombre => "SAN FELIPE DE JESUS", :state_id=> 26
  	City.create :nombre => "SAN JAVIER", :state_id=> 26
  	City.create :nombre => "SAN LUIS RIO COLORADO", :state_id=> 26
  	City.create :nombre => "SAN MIGUEL DE HORCASITAS", :state_id=> 26
  	City.create :nombre => "SAN PEDRO DE LA CUEVA", :state_id=> 26
  	City.create :nombre => "SANTA ANA", :state_id=> 26
  	City.create :nombre => "SANTA CRUZ", :state_id=> 26
  	City.create :nombre => "SARIC", :state_id=> 26
  	City.create :nombre => "SOYOPA", :state_id=> 26
  	City.create :nombre => "SUAQUI GRANDE", :state_id=> 26
  	City.create :nombre => "TEPACHE", :state_id=> 26
  	City.create :nombre => "TRINCHERAS", :state_id=> 26
  	City.create :nombre => "TUBUTAMA", :state_id=> 26
  	City.create :nombre => "URES", :state_id=> 26
  	City.create :nombre => "VILLA HIDALGO", :state_id=> 26
  	City.create :nombre => "VILLA PESQUEIRA", :state_id=> 26
  	City.create :nombre => "YECORA", :state_id=> 26
  	City.create :nombre => "GENERAL PLUTARCO ELIAS CALLES", :state_id=> 26
  	City.create :nombre => "BENITO JUAREZ", :state_id=> 26
  	City.create :nombre => "SAN IGNACIO RIO MUERTO", :state_id=> 26
  	
  end
end

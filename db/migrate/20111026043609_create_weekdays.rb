# encoding: utf-8
class CreateWeekdays < ActiveRecord::Migration
  def change
    create_table :weekdays do |t|
      t.string :dayname
      t.integer :daynumber
t.integer :user_id
      t.timestamps
    end
      Weekday.create :dayname => "Todos"
      Weekday.create :dayname => "Domingo", :daynumber => 0
    	Weekday.create :dayname => "Lunes", :daynumber => 1
    	Weekday.create :dayname => "Martes", :daynumber => 2
    	Weekday.create :dayname => "Miércoles", :daynumber => 3
    	Weekday.create :dayname => "Jueves", :daynumber => 4
    	Weekday.create :dayname => "Viernes", :daynumber => 5
    	Weekday.create :dayname => "Sabado", :daynumber => 6
    	    	
  end
end

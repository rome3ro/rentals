# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111205004707) do

  create_table "cities", :force => true do |t|
    t.string   "nombre"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "code",            :null => false
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "cellphone"
    t.integer  "city_id"
    t.date     "birthday"
    t.integer  "gender_id"
    t.string   "email"
    t.string   "document_number"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["code"], :name => "index_customers_on_code", :unique => true

  create_table "genders", :force => true do |t|
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movie_formats", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movie_kinds", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "expiration_days"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", :force => true do |t|
    t.string   "code",                               :null => false
    t.string   "name"
    t.integer  "movie_format_id"
    t.string   "imdb_id"
    t.date     "released"
    t.string   "genres"
    t.string   "actors"
    t.string   "director"
    t.boolean  "checked",         :default => false
    t.string   "poster"
    t.date     "movie_date_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movies", ["code"], :name => "index_movies_on_code", :unique => true

  create_table "payments", :force => true do |t|
    t.decimal  "payment",        :precision => 10, :scale => 0
    t.integer  "rent_detail_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "references", :force => true do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "cellphone"
    t.integer  "city_id"
    t.date     "birthday"
    t.integer  "gender_id"
    t.string   "email"
    t.string   "document_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rent_details", :force => true do |t|
    t.integer  "rent_id"
    t.integer  "movie_id"
    t.string   "movie_code_name"
    t.integer  "movie_kind_id"
    t.integer  "rent_price_id"
    t.boolean  "delivered",                                        :default => false, :null => false
    t.datetime "delivered_date"
    t.datetime "deliver_date"
    t.integer  "surcharge_days",                                   :default => 0
    t.decimal  "surcharge",         :precision => 10, :scale => 0, :default => 0
    t.decimal  "pending_surcharge", :precision => 10, :scale => 0, :default => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rent_prices", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price",           :precision => 10, :scale => 0
    t.integer  "days"
    t.integer  "weekday_id"
    t.decimal  "surcharge",       :precision => 10, :scale => 0
    t.integer  "movie_kind_id"
    t.integer  "movies_quantity"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rents", :force => true do |t|
    t.string   "customer_id"
    t.string   "customer_code_name"
    t.decimal  "total",              :precision => 10, :scale => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",                              :default => "", :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "weekdays", :force => true do |t|
    t.string   "dayname"
    t.integer  "daynumber"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

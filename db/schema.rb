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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_01_015618) do

  create_table "addresses", options: "CREATE TABLE \"addresses\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"address_type\" varchar(255) DEFAULT NULL,\n  \"status\" varchar(255) DEFAULT NULL,\n  \"entity\" varchar(255) DEFAULT NULL,\n  \"number_and_street\" varchar(255) DEFAULT NULL,\n  \"suite_and_apartment\" varchar(255) DEFAULT NULL,\n  \"city\" varchar(255) DEFAULT NULL,\n  \"postal_code\" varchar(255) DEFAULT NULL,\n  \"country\" varchar(255) DEFAULT NULL,\n  \"notes\" varchar(255) DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"latitude\" float DEFAULT NULL,\n  \"longitude\" float DEFAULT NULL,\n  PRIMARY KEY (\"id\")\n)", force: :cascade do |t|
    t.string "address_type"
    t.string "status"
    t.string "entity"
    t.string "number_and_street"
    t.string "suite_and_apartment"
    t.string "city"
    t.string "postal_code"
    t.string "country"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "batteries", options: "CREATE TABLE \"batteries\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"battery_type\" varchar(255) DEFAULT NULL,\n  \"status\" varchar(255) DEFAULT NULL,\n  \"date_of_commissioning\" date DEFAULT NULL,\n  \"date_of_last_inspection\" date DEFAULT NULL,\n  \"certificate_of_operations\" varchar(255) DEFAULT NULL,\n  \"information\" varchar(255) DEFAULT NULL,\n  \"notes\" text,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"building_id\" bigint DEFAULT NULL,\n  \"employee_id\" bigint DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_batteries_on_building_id\" (\"building_id\"),\n  KEY \"index_batteries_on_employee_id\" (\"employee_id\"),\n  CONSTRAINT \"fk_rails_ceeeaf55f7\" FOREIGN KEY (\"employee_id\") REFERENCES \"employees\" (\"id\") ON DELETE CASCADE ON UPDATE CASCADE,\n  CONSTRAINT \"fk_rails_fc40470545\" FOREIGN KEY (\"building_id\") REFERENCES \"buildings\" (\"id\") ON DELETE CASCADE ON UPDATE CASCADE\n)", force: :cascade do |t|
    t.string "battery_type"
    t.string "status"
    t.date "date_of_commissioning"
    t.date "date_of_last_inspection"
    t.string "certificate_of_operations"
    t.string "information"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "building_id"
    t.bigint "employee_id"
    t.index ["building_id"], name: "index_batteries_on_building_id"
    t.index ["employee_id"], name: "index_batteries_on_employee_id"
  end

  create_table "building_details", options: "CREATE TABLE \"building_details\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"information_key\" varchar(255) DEFAULT NULL,\n  \"value\" varchar(255) DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"building_id\" bigint DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_building_details_on_building_id\" (\"building_id\"),\n  CONSTRAINT \"fk_rails_51749f8eac\" FOREIGN KEY (\"building_id\") REFERENCES \"buildings\" (\"id\") ON DELETE CASCADE ON UPDATE CASCADE\n)", force: :cascade do |t|
    t.string "information_key"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "building_id"
    t.index ["building_id"], name: "index_building_details_on_building_id"
  end

  create_table "buildings", options: "CREATE TABLE \"buildings\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"admin_name\" varchar(255) DEFAULT NULL,\n  \"admin_email\" varchar(255) DEFAULT NULL,\n  \"admin_phone_numer\" varchar(255) DEFAULT NULL,\n  \"tech_full_name\" varchar(255) DEFAULT NULL,\n  \"tech_email\" varchar(255) DEFAULT NULL,\n  \"tech_phone_number\" varchar(255) DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"address_id\" bigint DEFAULT NULL,\n  \"customer_id\" bigint DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_buildings_on_address_id\" (\"address_id\"),\n  KEY \"index_buildings_on_customer_id\" (\"customer_id\"),\n  CONSTRAINT \"fk_rails_6dc7a885ab\" FOREIGN KEY (\"address_id\") REFERENCES \"addresses\" (\"id\") ON DELETE CASCADE ON UPDATE CASCADE,\n  CONSTRAINT \"fk_rails_c29cbe7fb8\" FOREIGN KEY (\"customer_id\") REFERENCES \"customers\" (\"id\") ON DELETE CASCADE ON UPDATE CASCADE\n)", force: :cascade do |t|
    t.string "admin_name"
    t.string "admin_email"
    t.string "admin_phone_numer"
    t.string "tech_full_name"
    t.string "tech_email"
    t.string "tech_phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id"
    t.bigint "customer_id"
    t.index ["address_id"], name: "index_buildings_on_address_id"
    t.index ["customer_id"], name: "index_buildings_on_customer_id"
  end

  create_table "columns", options: "CREATE TABLE \"columns\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"column_type\" varchar(255) DEFAULT NULL,\n  \"number_of_floor\" int DEFAULT NULL,\n  \"status\" varchar(255) DEFAULT NULL,\n  \"information\" varchar(255) DEFAULT NULL,\n  \"notes\" text,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"battery_id\" bigint DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_columns_on_battery_id\" (\"battery_id\"),\n  CONSTRAINT \"fk_rails_021eb14ac4\" FOREIGN KEY (\"battery_id\") REFERENCES \"batteries\" (\"id\") ON DELETE CASCADE ON UPDATE CASCADE\n)", force: :cascade do |t|
    t.string "column_type"
    t.integer "number_of_floor"
    t.string "status"
    t.string "information"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "battery_id"
    t.index ["battery_id"], name: "index_columns_on_battery_id"
  end

  create_table "customers", options: "CREATE TABLE \"customers\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"company_name\" varchar(255) DEFAULT NULL,\n  \"company_contact_name\" varchar(255) DEFAULT NULL,\n  \"contact_phone\" varchar(255) DEFAULT NULL,\n  \"contact_email\" varchar(255) DEFAULT NULL,\n  \"company_description\" varchar(255) DEFAULT NULL,\n  \"service_tech_name\" varchar(255) DEFAULT NULL,\n  \"service_tech_phone\" varchar(255) DEFAULT NULL,\n  \"service_tech_email\" varchar(255) DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"address_id\" bigint DEFAULT NULL,\n  \"user_id\" bigint DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_customers_on_address_id\" (\"address_id\"),\n  KEY \"index_customers_on_user_id\" (\"user_id\"),\n  CONSTRAINT \"fk_rails_3f9404ba26\" FOREIGN KEY (\"address_id\") REFERENCES \"addresses\" (\"id\") ON DELETE CASCADE ON UPDATE CASCADE,\n  CONSTRAINT \"fk_rails_9917eeaf5d\" FOREIGN KEY (\"user_id\") REFERENCES \"users\" (\"id\") ON DELETE CASCADE ON UPDATE CASCADE\n)", force: :cascade do |t|
    t.string "company_name"
    t.string "company_contact_name"
    t.string "contact_phone"
    t.string "contact_email"
    t.string "company_description"
    t.string "service_tech_name"
    t.string "service_tech_phone"
    t.string "service_tech_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id"
    t.bigint "user_id"
    t.index ["address_id"], name: "index_customers_on_address_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "elevators", options: "CREATE TABLE \"elevators\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"serial_number\" varchar(255) DEFAULT NULL,\n  \"model\" varchar(255) DEFAULT NULL,\n  \"elevator_type\" varchar(255) DEFAULT NULL,\n  \"status\" varchar(255) DEFAULT NULL,\n  \"date_of_commissioning\" date DEFAULT NULL,\n  \"date_of_last_inspection\" date DEFAULT NULL,\n  \"certificate_of_inspection\" varchar(255) DEFAULT NULL,\n  \"notes\" text,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"column_id\" bigint DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_elevators_on_column_id\" (\"column_id\"),\n  CONSTRAINT \"fk_rails_69442d7bc2\" FOREIGN KEY (\"column_id\") REFERENCES \"columns\" (\"id\") ON DELETE CASCADE ON UPDATE CASCADE\n)", force: :cascade do |t|
    t.string "serial_number"
    t.string "model"
    t.string "elevator_type"
    t.string "status"
    t.date "date_of_commissioning"
    t.date "date_of_last_inspection"
    t.string "certificate_of_inspection"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "column_id"
    t.index ["column_id"], name: "index_elevators_on_column_id"
  end

  create_table "employees", options: "CREATE TABLE \"employees\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"first_name\" varchar(255) DEFAULT NULL,\n  \"last_name\" varchar(255) DEFAULT NULL,\n  \"title\" varchar(255) DEFAULT NULL,\n  \"email\" varchar(255) DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"user_id\" bigint DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_employees_on_user_id\" (\"user_id\"),\n  CONSTRAINT \"fk_rails_dcfd3d4fc3\" FOREIGN KEY (\"user_id\") REFERENCES \"users\" (\"id\")\n)", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "interventions", options: "CREATE TABLE \"interventions\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"user_id\" bigint DEFAULT NULL,\n  \"customer_id\" bigint DEFAULT NULL,\n  \"building_id\" bigint DEFAULT NULL,\n  \"battery_id\" bigint DEFAULT NULL,\n  \"column_id\" bigint DEFAULT NULL,\n  \"elevator_id\" bigint DEFAULT NULL,\n  \"employee_id\" bigint DEFAULT NULL,\n  \"intervention_start\" datetime DEFAULT NULL,\n  \"intervention_end\" datetime DEFAULT NULL,\n  \"result\" varchar(255) DEFAULT NULL,\n  \"report\" text,\n  \"status\" varchar(255) DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_interventions_on_user_id\" (\"user_id\"),\n  KEY \"index_interventions_on_customer_id\" (\"customer_id\"),\n  KEY \"index_interventions_on_building_id\" (\"building_id\"),\n  KEY \"index_interventions_on_battery_id\" (\"battery_id\"),\n  KEY \"index_interventions_on_column_id\" (\"column_id\"),\n  KEY \"index_interventions_on_elevator_id\" (\"elevator_id\"),\n  KEY \"index_interventions_on_employee_id\" (\"employee_id\"),\n  CONSTRAINT \"fk_rails_11b5a4bd36\" FOREIGN KEY (\"elevator_id\") REFERENCES \"elevators\" (\"id\"),\n  CONSTRAINT \"fk_rails_268aede6d6\" FOREIGN KEY (\"battery_id\") REFERENCES \"batteries\" (\"id\"),\n  CONSTRAINT \"fk_rails_2e0d31b7ad\" FOREIGN KEY (\"employee_id\") REFERENCES \"employees\" (\"id\"),\n  CONSTRAINT \"fk_rails_4242c0f569\" FOREIGN KEY (\"customer_id\") REFERENCES \"customers\" (\"id\"),\n  CONSTRAINT \"fk_rails_911b4ef939\" FOREIGN KEY (\"building_id\") REFERENCES \"buildings\" (\"id\"),\n  CONSTRAINT \"fk_rails_99380975b7\" FOREIGN KEY (\"user_id\") REFERENCES \"users\" (\"id\"),\n  CONSTRAINT \"fk_rails_d05fb241b3\" FOREIGN KEY (\"column_id\") REFERENCES \"columns\" (\"id\")\n)", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "customer_id"
    t.bigint "building_id"
    t.bigint "battery_id"
    t.bigint "column_id"
    t.bigint "elevator_id"
    t.bigint "employee_id"
    t.datetime "intervention_start"
    t.datetime "intervention_end"
    t.string "result"
    t.text "report"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battery_id"], name: "index_interventions_on_battery_id"
    t.index ["building_id"], name: "index_interventions_on_building_id"
    t.index ["column_id"], name: "index_interventions_on_column_id"
    t.index ["customer_id"], name: "index_interventions_on_customer_id"
    t.index ["elevator_id"], name: "index_interventions_on_elevator_id"
    t.index ["employee_id"], name: "index_interventions_on_employee_id"
    t.index ["user_id"], name: "index_interventions_on_user_id"
  end

  create_table "leads", options: "CREATE TABLE \"leads\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"full_name\" varchar(255) DEFAULT NULL,\n  \"company_name\" varchar(255) DEFAULT NULL,\n  \"email\" varchar(255) DEFAULT NULL,\n  \"phone_number\" varchar(255) DEFAULT NULL,\n  \"project_name\" varchar(255) DEFAULT NULL,\n  \"project_description\" text,\n  \"department\" varchar(255) DEFAULT NULL,\n  \"message\" mediumtext,\n  \"attachment\" longblob,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"created_on\" date DEFAULT NULL,\n  \"filename\" varchar(255) DEFAULT NULL,\n  PRIMARY KEY (\"id\")\n)", force: :cascade do |t|
    t.string "full_name"
    t.string "company_name"
    t.string "email"
    t.string "phone_number"
    t.string "project_name"
    t.text "project_description"
    t.string "department"
    t.text "message", limit: 16777215
    t.binary "attachment", limit: 4294967295
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "created_on"
    t.string "filename"
  end

  create_table "quotes", options: "CREATE TABLE \"quotes\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"company_name\" varchar(255) DEFAULT NULL,\n  \"email\" varchar(255) DEFAULT NULL,\n  \"phone_number\" varchar(255) DEFAULT NULL,\n  \"building_type\" varchar(255) DEFAULT NULL,\n  \"apartments\" varchar(255) DEFAULT NULL,\n  \"floors\" varchar(255) DEFAULT NULL,\n  \"basements\" varchar(255) DEFAULT NULL,\n  \"elevators\" varchar(255) DEFAULT NULL,\n  \"companies\" varchar(255) DEFAULT NULL,\n  \"parking_spots\" varchar(255) DEFAULT NULL,\n  \"corporations\" varchar(255) DEFAULT NULL,\n  \"maximum_occupancy\" varchar(255) DEFAULT NULL,\n  \"business_hours\" varchar(255) DEFAULT NULL,\n  \"services_type\" varchar(255) DEFAULT NULL,\n  \"amount_of_elevator\" varchar(255) DEFAULT NULL,\n  \"price_per_elevator\" varchar(255) DEFAULT NULL,\n  \"installation\" varchar(255) DEFAULT NULL,\n  \"price_elevator_total\" varchar(255) DEFAULT NULL,\n  \"total_price\" varchar(255) DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"created_on\" date DEFAULT NULL,\n  PRIMARY KEY (\"id\")\n)", force: :cascade do |t|
    t.string "company_name"
    t.string "email"
    t.string "phone_number"
    t.string "building_type"
    t.string "apartments"
    t.string "floors"
    t.string "basements"
    t.string "elevators"
    t.string "companies"
    t.string "parking_spots"
    t.string "corporations"
    t.string "maximum_occupancy"
    t.string "business_hours"
    t.string "services_type"
    t.string "amount_of_elevator"
    t.string "price_per_elevator"
    t.string "installation"
    t.string "price_elevator_total"
    t.string "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "created_on"
  end

  create_table "users", options: "CREATE TABLE \"users\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"email\" varchar(255) NOT NULL DEFAULT '',\n  \"encrypted_password\" varchar(255) NOT NULL DEFAULT '',\n  \"reset_password_token\" varchar(255) DEFAULT NULL,\n  \"reset_password_sent_at\" datetime DEFAULT NULL,\n  \"remember_created_at\" datetime DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"is_admin\" tinyint(1) DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  UNIQUE KEY \"index_users_on_email\" (\"email\"),\n  UNIQUE KEY \"index_users_on_reset_password_token\" (\"reset_password_token\")\n)", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "batteries", "buildings", on_update: :cascade, on_delete: :cascade
  add_foreign_key "batteries", "employees", on_update: :cascade, on_delete: :cascade
  add_foreign_key "building_details", "buildings", on_update: :cascade, on_delete: :cascade
  add_foreign_key "buildings", "addresses", on_update: :cascade, on_delete: :cascade
  add_foreign_key "buildings", "customers", on_update: :cascade, on_delete: :cascade
  add_foreign_key "columns", "batteries", on_update: :cascade, on_delete: :cascade
  add_foreign_key "customers", "addresses", on_update: :cascade, on_delete: :cascade
  add_foreign_key "customers", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "elevators", "columns", on_update: :cascade, on_delete: :cascade
  add_foreign_key "employees", "users"
  add_foreign_key "interventions", "batteries"
  add_foreign_key "interventions", "buildings"
  add_foreign_key "interventions", "columns"
  add_foreign_key "interventions", "customers"
  add_foreign_key "interventions", "elevators"
  add_foreign_key "interventions", "employees"
  add_foreign_key "interventions", "users"
end

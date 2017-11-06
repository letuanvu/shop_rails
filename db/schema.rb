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

ActiveRecord::Schema.define(version: 20171101121115) do

  create_table "accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree
  end

  create_table "administrators", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "admin_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "accounts_id"
    t.index ["accounts_id"], name: "index_administrators_on_accounts_id", using: :btree
    t.index ["id"], name: "index_administrators_on_id", unique: true, using: :btree
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "customerName"
    t.string   "creditCardInfo"
    t.text     "address",        limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "accounts_id"
    t.index ["accounts_id"], name: "index_customers_on_accounts_id", using: :btree
    t.index ["id"], name: "index_customers_on_id", unique: true, using: :btree
  end

  create_table "order_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.float    "unit_price",  limit: 24
    t.integer  "products_id"
    t.integer  "orders_id"
    t.index ["orders_id"], name: "index_order_products_on_orders_id", using: :btree
    t.index ["products_id"], name: "index_order_products_on_products_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "orderStatus"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "shipping_infos_id"
    t.integer  "customers_id"
    t.index ["customers_id"], name: "index_orders_on_customers_id", using: :btree
    t.index ["id"], name: "index_orders_on_id", unique: true, using: :btree
    t.index ["shipping_infos_id"], name: "index_orders_on_shipping_infos_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "price",      limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["id"], name: "index_products_on_id", unique: true, using: :btree
  end

  create_table "shipping_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "shipping_type"
    t.integer  "shipping_cost"
    t.integer  "shipping_region_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["id"], name: "index_shipping_infos_on_id", unique: true, using: :btree
  end

  add_foreign_key "administrators", "accounts", column: "accounts_id"
  add_foreign_key "customers", "accounts", column: "accounts_id"
  add_foreign_key "order_products", "orders", column: "orders_id"
  add_foreign_key "order_products", "products", column: "products_id"
  add_foreign_key "orders", "customers", column: "customers_id"
  add_foreign_key "orders", "shipping_infos", column: "shipping_infos_id"
end

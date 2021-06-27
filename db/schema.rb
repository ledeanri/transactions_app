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

ActiveRecord::Schema.define(version: 2021_06_27_003659) do

  create_table "accounts", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount"
    t.string "account_number"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "balances", force: :cascade do |t|
    t.integer "account_id"
    t.integer "transfer_id"
    t.integer "deposit_id"
    t.integer "withdrawal_id"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_balances_on_account_id"
    t.index ["deposit_id"], name: "index_balances_on_deposit_id"
    t.index ["transfer_id"], name: "index_balances_on_transfer_id"
    t.index ["withdrawal_id"], name: "index_balances_on_withdrawal_id"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "balance"
    t.string "account_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "deposits", force: :cascade do |t|
    t.integer "account_id"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "transaction_number"
    t.index ["account_id"], name: "index_deposits_on_account_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.integer "account_id"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "transaction_number"
    t.index ["account_id"], name: "index_transfers_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "withdrawals", force: :cascade do |t|
    t.integer "account_id"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "transaction_number"
    t.index ["account_id"], name: "index_withdrawals_on_account_id"
  end

end

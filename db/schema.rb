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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160518184851) do

  PRAGMA FOREIGN_KEYS = ON;
  create_table "users", force: :cascade do |t|
    t.string   "email",                  :default=>"", :null=>false, :index=>{:name=>"index_users_on_email", :unique=>true}
    t.string   "encrypted_password",     :default=>"", :null=>false
    t.string   "reset_password_token",   :index=>{:name=>"index_users_on_reset_password_token", :unique=>true}
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default=>0, :null=>false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token",     :index=>{:name=>"index_users_on_confirmation_token", :unique=>true}
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default=>0, :null=>false
    t.string   "unlock_token",           :index=>{:name=>"index_users_on_unlock_token", :unique=>true}
    t.datetime "locked_at"
    t.string   "dni",                    :default=>"", :null=>false
    t.string   "first_name",             :default=>"", :null=>false
    t.string   "last_name",              :default=>"", :null=>false
    t.string   "phone",                  :default=>""
    t.datetime "created_at",             :null=>false
    t.datetime "updated_at",             :null=>false
  end

  create_table "devices", force: :cascade do |t|
    t.integer  "user_id",     :index=>{:name=>"fk__devices_user_id"}, :foreign_key=>{:references=>"users", :name=>"fk_devices_user_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.integer  "devise_type"
    t.string   "uuid"
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id",  :null=>false, :index=>{:name=>"fk__messages_sender_id"}, :foreign_key=>{:references=>"users", :name=>"fk_messages_sender_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.text     "body"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "access_token"
    t.string   "refresh_token"
    t.datetime "expired_at"
    t.integer  "device_id",     :index=>{:name=>"fk__sessions_device_id"}, :foreign_key=>{:references=>"devices", :name=>"fk_sessions_device_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.datetime "created_at",    :null=>false
    t.datetime "updated_at",    :null=>false
  end

  create_table "user_messages", force: :cascade do |t|
    t.integer  "user_id",    :index=>{:name=>"fk__user_messages_user_id"}, :foreign_key=>{:references=>"users", :name=>"fk_user_messages_user_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.integer  "message_id", :index=>{:name=>"fk__user_messages_message_id"}, :foreign_key=>{:references=>"messages", :name=>"fk_user_messages_message_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.boolean  "read",       :default=>false, :null=>false
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

end

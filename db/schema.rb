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

ActiveRecord::Schema.define(:version => 20120709184148) do

  create_table "arbitros", :force => true do |t|
    t.string   "nome"
    t.date     "data_de_nascimento"
    t.string   "email"
    t.text     "rua"
    t.string   "rg"
    t.string   "cpf"
    t.text     "cursos_de_arbitragem"
    t.date     "ano_do_curso_de_arbitragem"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "telefone"
    t.string   "celular"
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "numero"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.string   "cep"
    t.string   "complemento"
  end

  add_index "arbitros", ["user_id"], :name => "index_arbitros_on_user_id"

  create_table "atletas", :force => true do |t|
    t.string   "codigo"
    t.string   "nome"
    t.string   "email"
    t.date     "data_de_nascimento"
    t.text     "rua"
    t.string   "rg"
    t.string   "cpf"
    t.string   "nome_do_pai"
    t.string   "nome_da_mae"
    t.string   "entidade_filiada"
    t.integer  "ranking"
    t.string   "categoria"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "telefone"
    t.string   "celular"
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "numero"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.string   "cep"
    t.string   "complemento"
  end

  add_index "atletas", ["user_id"], :name => "index_atletas_on_user_id"

  create_table "atletas_modalidades", :id => false, :force => true do |t|
    t.integer "atleta_id",     :null => false
    t.integer "modalidade_id", :null => false
  end

  create_table "modalidades", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tecnicos", :force => true do |t|
    t.string   "nome"
    t.date     "data_de_nascimento"
    t.string   "telefone"
    t.string   "celular"
    t.string   "email"
    t.text     "rua"
    t.string   "rg"
    t.string   "cpf"
    t.string   "intituicao_de_ensino"
    t.string   "cref"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "numero"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.string   "cep"
    t.string   "complemento"
  end

  add_index "tecnicos", ["user_id"], :name => "index_tecnicos_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "logotipo_file_name"
    t.string   "logotipo_content_type"
    t.integer  "logotipo_file_size"
    t.datetime "logotipo_updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Modalidade.create(tipo: 'Simples Masculina (SM)')
Modalidade.create(tipo: 'Simples Feminina (SF)')
Modalidade.create(tipo: 'Dupla Masculina (DM)')
Modalidade.create(tipo: 'Dupla Feminina (DF)')
Modalidade.create(tipo: 'Dupla Mista (DX)')
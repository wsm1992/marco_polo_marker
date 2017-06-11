# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.where(id: 1, name: 'Siuming').first_or_create
User.where(id: 2, name: 'Terence').first_or_create
User.where(id: 3, name: 'Fred').first_or_create
User.where(id: 4, name: 'Peter').first_or_create

Role.where(id: 1, name: '控骰').first_or_create
Role.where(id: 2, name: '攞合約').first_or_create
Role.where(id: 3, name: '疊骰').first_or_create
Role.where(id: 4, name: '資源王').first_or_create

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Season.where(id: 1, name: '原版').first_or_create
Season.where(id: 2, name: '威尼斯擴展').first_or_create
Season.where(id: 3, name: '馬可波羅2').first_or_create
Season.where(id: 4, name: '馬可波羅2-2').first_or_create

User.where(id: 1, name: 'Siuming').first_or_create
User.where(id: 2, name: 'Terence').first_or_create
User.where(id: 3, name: 'Fred').first_or_create
User.where(id: 4, name: 'Peter').first_or_create

Role.where(id: 1, name: '控骰').first_or_create
Role.where(id: 2, name: '攞合約').first_or_create
Role.where(id: 3, name: '疊骰').first_or_create
Role.where(id: 4, name: '資源王').first_or_create
Role.where(id: 5, name: '跳跳跳').first_or_create
Role.where(id: 6, name: '公主').first_or_create
Role.where(id: 7, name: '成吉思汗').first_or_create
Role.where(id: 8, name: '馬可波羅').first_or_create
Role.where(id: 9, name: '禮物佬').first_or_create
Role.where(id: 10, name: '起屋佬').first_or_create
Role.where(id: 11, name: '強盜').first_or_create
Role.where(id: 12, name: '六張卡').first_or_create
Role.where(id: 13, name: '左慈').first_or_create
Role.where(id: 14, name: '隨從佬').first_or_create
Role.where(id: 15, name: '新六張卡').first_or_create
Role.where(id: 16, name: '五粒骰').first_or_create
Role.where(id: 17, name: '踼骰佬').first_or_create
Role.where(id: 18, name: '思隙趴夫').first_or_create

Role.where(id: 19, name: '過綠洲').first_or_create
Role.where(id: 20, name: '攞公會').first_or_create
Role.where(id: 21, name: '合約玉').first_or_create
Role.where(id: 22, name: '雙獎勵').first_or_create
Role.where(id: 23, name: '大城鎮').first_or_create
Role.where(id: 24, name: '重擲王').first_or_create
Role.where(id: 25, name: '減路費').first_or_create

Shield.where(id: 1, name: '太陽').first_or_create
Shield.where(id: 2, name: '竹').first_or_create
Shield.where(id: 3, name: '雞').first_or_create
Shield.where(id: 4, name: '馬騮').first_or_create
Shield.where(id: 5, name: '雲').first_or_create
Shield.where(id: 6, name: '花').first_or_create
Shield.where(id: 7, name: '月亮').first_or_create
Shield.where(id: 8, name: '蛇').first_or_create
Shield.where(id: 9, name: '飛鏢').first_or_create

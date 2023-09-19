# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.create!(
   email: 'test@test.com',
   last_name: 'テスト',
   first_name: '太郎',
   last_name_kana: 'テスト',
   first_name_kana: 'タロウ',
   postal_code: '0000000',
   address: 'テスト',
   telephone_number: '0000000000',
   is_active: 'false',
   encrypted_password: '000000'
)

Admin.create!(
   email: 'testc@testc.com',
   encrypted_password: '111111'
)

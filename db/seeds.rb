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
   password: '000000'
)

Admin.create!(
   email: 'testc@testc.com',
   password: '111111'
)

Genre.create!(
  [
    {
      name: 'ケーキ',
    },
    {
      name: '焼き菓子',
    },
    {
      name: 'プリン',
    },
    {
      name: 'キャンディ',
    }
  ]
)

Item.create!(
  [
    {
      genre_id: 1,
      name: 'ケーキ',
      description: 'test',
      price: 1000,
      is_on_sale: true,
      item_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/cake1.jpg")),filename: 'no_image.jpg')
    },
    {
      genre_id: 2,
      name: '焼き菓子',
      description: 'test',
      price: 1000,
      is_on_sale: true,
      item_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/bakedsweets1.jpg")),filename: 'no_image.jpg')
    },
    {
      genre_id: 3,
      name: 'プリン',
      description: 'test',
      price: 1000,
      is_on_sale: true,
      item_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/pudding1.jpg")),filename: 'no_image.jpg')
    },
    {
      genre_id: 4,
      name: 'キャンディ',
      description: 'test',
      price: 1000,
      is_on_sale: false,
      item_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/candy1.jpg")),filename: 'no_image.jpg')
    },
    {
      genre_id: 1,
      name: 'ケーキ',
      description: 'test',
      price: 1000,
      is_on_sale: true,
      item_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/cake2.jpg")),filename: 'no_image.jpg')
    },
    {
      genre_id: 2,
      name: '焼き菓子',
      description: 'test',
      price: 1000,
      is_on_sale: true,
      item_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/bakedsweets2.jpg")),filename: 'no_image.jpg')
    },
    {
      genre_id: 3,
      name: 'プリン',
      description: 'test',
      price: 1000,
      is_on_sale: false,
      item_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/pudding2.jpg")),filename: 'no_image.jpg')
    },
    {
      genre_id: 4,
      name: 'キャンディ',
      description: 'test',
      price: 1000,
      is_on_sale: true,
      item_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/candy2.jpg")),filename: 'no_image.jpg')
    },
    {
      genre_id: 1,
      name: 'ケーキ',
      description: 'test',
      price: 1000,
      is_on_sale: true,
      item_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/cake3.jpg")),filename: 'no_image.jpg')
    },
    {
      genre_id: 2,
      name: '焼き菓子',
      description: 'test',
      price: 1000,
      is_on_sale: false,
      item_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/bakedsweets3.jpg")),filename: 'no_image.jpg')
    }
  ]
)

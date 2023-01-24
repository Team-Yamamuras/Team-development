# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: "yamamura@gmail.com", password: "sadako")

Category.create(category: "test")

10.times do |n|
    Item.create(
        category_id: 1,
        name: "アイスクリーム#{n}",
        introduction: "テスト",
        price_without_tax: 200,
        is_active: true,
        image: ActiveStorage::Blob.create_and_upload!(io: File.open(File.join(Rails.root,"app/assets/images/no_image.jpg")), filename:"no_image.jpg")
    )
end

CartItem.create(
    item_id: 9,
    customer_id: 1,
    count: 3
    )

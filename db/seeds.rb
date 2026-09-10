# This file should ensure the existence of records required to run the application in every environment.
# The data can be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

products = [
  { name: "Coffee Mug", description: "A sturdy ceramic mug for hot drinks.", price: 9.99, image_url: "https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?w=600" },
  { name: "Notebook", description: "A dotted notebook for notes and sketches.", price: 4.99, image_url: "https://images.unsplash.com/photo-1531346878377-a5be20824e16?w=600" },
  { name: "Desk Lamp", description: "A warm LED lamp for late sessions.", price: 24.50, image_url: "https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=600" },
  { name: "Keyboard", description: "A compact mechanical keyboard.", price: 49.00, image_url: "https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=600" }
]

products.each do |attrs|
  Product.find_or_create_by!(name: attrs[:name]) do |product|
    product.assign_attributes(attrs)
  end
end

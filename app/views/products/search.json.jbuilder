# json形式のデータを配列で返す場合の記述法
json.array! @products do |product|
  json.id product.id
  json.title product.title
  json.image product.image_url
  json.detail product.detail
end

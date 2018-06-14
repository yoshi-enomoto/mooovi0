# 『do』の前に渡すインスタンス変数を置く！
json.array! @products do |product|
  json.id product.id
  json.title product.title
  json.image product.image_url
  json.detail product.detail
  json.director product.director
end

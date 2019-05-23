json.extract! haberler, :id, :baslik, :resim, :icerik, :created_at, :updated_at
json.url haberler_url(haberler, format: :json)

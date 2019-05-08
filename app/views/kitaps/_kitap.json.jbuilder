json.extract! kitap, :id, :isim, :ozet, :sayfa, :created_at, :updated_at
json.url kitap_url(kitap, format: :json)

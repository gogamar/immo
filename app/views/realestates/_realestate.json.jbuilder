json.extract! realestate, :id, :idfile, :idagency, :rstype, :reference, :country, :speclocation, :typestreet, :namestreet, :numberstreet, :usurface, :csurface, :salesprice, :rentprice, :region, :province, :town, :postcode, :area, :title, :ad, :created_at, :updated_at
json.url realestate_url(realestate, format: :json)

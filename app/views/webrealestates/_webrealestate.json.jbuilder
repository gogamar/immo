json.extract! webrealestate, :id, :status, :rstype, :operation, :price, :address, :surface, :bedrooms, :terrace, :lift, :owner, :email, :phone, :created_at, :updated_at
json.url webrealestate_url(webrealestate, format: :json)

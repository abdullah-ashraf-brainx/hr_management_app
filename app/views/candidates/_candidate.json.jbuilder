json.extract! candidate, :id, :name, :email, :phone, :university, :experience, :hiring_position_id, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)

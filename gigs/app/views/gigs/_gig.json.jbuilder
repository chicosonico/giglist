json.extract! gig, :id, :gig_name, :gig_date, :gig_cache, :gig_type, :created_at, :updated_at
json.url gig_url(gig, format: :json)

json.extract! movie, :id, :name, :director, :actor, :actress, :released_year, :industry_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)

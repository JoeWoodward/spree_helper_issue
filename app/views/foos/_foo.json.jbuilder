# frozen_string_literal: true

json.extract! foo, :id, :created_at, :updated_at
json.url foo_url(foo, format: :json)

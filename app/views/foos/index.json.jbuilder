# frozen_string_literal: true

json.array! @foos, partial: 'foos/foo', as: :foo

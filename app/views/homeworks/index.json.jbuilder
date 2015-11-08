json.array!(@homeworks) do |homework|
  json.extract! homework, :id, :title, :description, :duration, :start_date, :end_date, :author, :status
  json.url homework_url(homework, format: :json)
end

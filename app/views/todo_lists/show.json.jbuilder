json.array!@todos do |todo|
	json.id todo.id
	json.name todo.name
	json.priority todo.priority
	json.description todo.description
	json.due_date todo.due_date
end

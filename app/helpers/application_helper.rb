module ApplicationHelper

	def valor_formatado(number)
		number_to_currency number,
		unit: "R$",
		separator: ",",
		delimiter: "."
	end

	def percentual_formatado(number)
		number_to_percentage number,
		separator: ",",
		precision: 1
	end

	def link_to_add_fields(name, f, type, locals={})
		new_object = f.object.send "build_#{type}"
		id = "new_#{type}"
		fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
			render(type.to_s + "_fields", f: builder)
		end
		link_to(name, '#', class: [locals[:class], "add_fields"], data: {id: id, fields: fields.gsub("\n", "")})
	end


end

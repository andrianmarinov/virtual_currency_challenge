defmodule Encoder do

	def encode(integer) do
		if is_number(integer) do
			alphabet = Application.get_env(:virtual_currency, :alphabet)
			base = String.length(alphabet)
			alphabet_list = String.graphemes(alphabet)
			encode(integer, base, alphabet_list, "")
		end
	end


	defp encode(integer, base, alphabet_list, result) do
		if integer <= (base - 1) do
			result = result <> Enum.at(alphabet_list, integer)
		else
			new_int = div integer, base
			remainder = rem integer, base
			result = result <> Enum.at(alphabet_list, remainder)
			encode(new_int, base, alphabet_list, result)
		end
	end
end

defmodule Decoder do

	def decode(string) do
		alphabet = Application.get_env(:virtual_currency, :alphabet)
		base = String.length(alphabet)
		string_list = String.graphemes(string)
		decode(string_list, alphabet, base, 0, 0)
	end

	defp decode([head | tail], alphabet, base, cur_index, result) do
		{index, _} = :binary.match(alphabet, head)
		result = result + index * :math.pow(base, cur_index)
		decode(tail, alphabet, base, cur_index+1, result)

	end

	defp decode([], _, _, _, result) do
		result
	end
end
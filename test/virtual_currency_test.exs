defmodule EncoderTest do

	use ExUnit.Case
	import Encoder

	test ":encode" do
		assert encode(0) == "v"
		assert encode(14) == "vo"
		assert encode(2709) == "VGR"
		assert encode(162259276829213363391578010288127) == "aveGEregROEEevOGygEgOEyvEVego"
	end
end

defmodule DecoderTest do

	use ExUnit.Case
	import Decoder

	test ":decode" do
		assert decode("v") == 0
		assert decode("vo") == 14
		assert decode("VGR") == 2709
		# assert decode("aveGEregROEEevOGygEgOEyvEVego") == 162259276829213363391578010288127
	end
end

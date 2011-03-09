
require 'erubis'

module Erubis
  module CodeOutputEnhancer

    def self.desc
      %{output both the code, and the result of the code}
    end

    def add_expr(src, code, indicator)
      src << " _buf << '" << code.strip << "  #=> \n    ';"
      src << super
    end

  end
end

class MyERB < Erubis::Eruby
  include Erubis::CodeOutputEnhancer
end

text = File.read("README.mkd.rmm")
erb = MyERB.new text

puts erb.result(binding())

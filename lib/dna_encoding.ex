defmodule DNA do
  @moduledoc false

  def encode_nucleotide(?A), do: 0b0001
  def encode_nucleotide(?C), do: 0b0010
  def encode_nucleotide(?G), do: 0b0100
  def encode_nucleotide(?T), do: 0b1000
  def encode_nucleotide(?\s), do: 0b0000

  def decode_nucleotide(0b0001), do: ?A
  def decode_nucleotide(0b0010), do: ?C
  def decode_nucleotide(0b0100), do: ?G
  def decode_nucleotide(0b1000), do: ?T
  def decode_nucleotide(0b0000), do: ?\s

  @spec encode(charlist()) :: bitstring()
  def encode(dna), do: do_encode(dna, <<0::0>>)
  def do_encode([], acc), do: acc
  def do_encode([head | tail], acc), do: do_encode(tail, <<acc::bitstring, encode_nucleotide(head)::4>>)

  @spec decode(bitstring()) :: charlist()
  def decode(dna), do: do_decode(dna, '')
  defp do_decode(<<0::0>>, acc), do: acc
  defp do_decode(<<head::4, tail::bitstring>>, acc), do: do_decode(tail, acc ++ [decode_nucleotide(head)])
end

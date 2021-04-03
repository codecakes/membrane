# Membrane

Skunkwork for Distributed Cellular AI systems. 
Could be something, could be nothing.

Cellular interface: Skeletal API that exposes structures to build intelligent information systems based on Cellular structures.
  Vocabulary: Receptors, signals, environment, mutation (driven by external environment)
  Membrane was inspired by the podcast "Under The Skin" with Russel Brand featuring Bruce Lipton.
  Link: https://www.youtube.com/watch?v=6XmhVB8AIt0&ab_channel=RussellBrand
  
  It speaks about the remarkable cellular structure:
  a. membranes: they are receptors to environment and pass the message to nucleus.
  b. nucleus: Reproduction center i.e. gonads of the cell: this is what uses the cell culture based on information from
  the skin(receptors) of the cell i.e. membranes and generates information.

Fundamentally it starts with defining a cell:

```elixir

%Cell{
  cell_id: pos_integer | bitstring,
  receptor: term,
  signal: term,
  nucleus: term
  }

```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `membrane` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:membrane, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/membrane](https://hexdocs.pm/membrane).


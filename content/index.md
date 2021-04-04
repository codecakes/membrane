---
title: "Membrane"
date: 2021-04-04T22:27:00+05:30
draft: false
---

Skunkwork for Distributed Cellular AI systems. 

Could be something, could be nothing.

**Cellular interface**: Skeletal API that exposes structures to build intelligent information systems based on Cellular structures.

Vocabulary: Receptors, stages, signals, environment, mutation (driven by external environment)
  
  > Membrane was inspired by the podcast "Under The Skin" with Russel Brand featuring Bruce Lipton.
  Link:
  [![Under The Skin](https://img.youtube.com/vi/6XmhVB8AIt0/sddefault.jpg)](https://www.youtube.com/watch?v=6XmhVB8AIt0&ab_channel=RussellBrand)
  
  It speaks about the remarkable cellular structure:

  - membranes: they are receptors to environment and pass the message to nucleus.
  - nucleus: Reproduction center i.e. gonads of the cell: this is what uses the cell culture based on information from
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

"..When you look at yourself as a single entity, that is the illusion. That truth, which is the jumpy part, is that we are skin-covered Petri dishes inside of which are 50 trillion-plus cells. Inside the body is the original culture medium called blood.."
-- [Bruce Lipton](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6438088/)

A Cell's lifecycle then becomes honing ML models, better training and shaving off unhealthy cells. Once the cells are ready to split, reproducing becomes easy:

```elixir

@typedoc """
  Reproduces a cell into two daughter cells replicating from the original copy.
  """
@type reproduce_t :: (%{
  :cell_id => cell_id :: Cell.cell_id_t,
  :cell_stages => cell_stages :: cell_stages_t,
  } -> {new_cell_state_ :: new_cell_state_t, new_cell_state :: new_cell_state_t})

@spec replicate(lifecycle_eligibility_checks, reproduce_t) :: list(new_cell_state_t)
def replicate(%{}, reproduce_fn) do
  # lifecycle_eligibility_checks
  # reproduce
end
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

# Shortcuts for now
export reals, bools, integers, unit, Thetas

bools(θ) = unit(θ) > 0.5
bound(θ, a, b, c) = unit(θ, T) * b - a + a
reals(θ, T = Float64) = (unit(θ, T) - 0.5) * 100.0
integers(θ) = rand(Int64)

const ℝ = reals
const 𝔹 = bools
const ℤ = integers

function choose(branches, θ)
  return 1
end

mutable struct Thetas{A, B}
  stack::A
  path::B
end

newthetas() = Thetas(Tuple[], Int[])

function updatepath(thetas::Thetas, bid::BlockId) 
  println("update path: ", bid, ", thetas: ", thetas)
  push!(thetas.path, bid)
end
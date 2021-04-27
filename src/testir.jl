using ParametricInversion
using IRTools

const PI = ParametricInversion

function complex(x)
  if x > 100
    x = x * x
  else
    y = x + 1
    x = x * y
  end
  x
end

function simple(x)
  x+1
end

# println(ParametricInversion.invertir(typeof(f), Tuple{Float64}))

# pgfir = ParametricInversion.makePGFir(typeof(simple), Tuple{Int64})
# # pgfir = ParametricInversion.makePGFir(typeof(f), Tuple{Int64})
# pgfir = pgfir |> IRTools.ssa! |> IRTools.prune! |> IRTools.renumber
# println(pgfir)

# pgf = IRTools.func(pgfir)
# println(pgf(typeof(simple), 3))

# println(pgfapply(simple, (Int64,), 3))

# ### WORKING
# ir = ParametricInversion.makePGFir(typeof(simple), Tuple{Int})
# println(ir)
# g = IRTools.func(ir)
# ϴ = g(nothing,3)
# println(ϴ)

# invir = ParametricInversion.invertir(typeof(simple), Tuple{Int})
# println(invir)
# invg = IRTools.func(invir)
# println(invg(nothing, simple, (Int,), simple(3), ϴ))

## test choose

loc = PI.Loc(3, IRTools.Inner.Variable(3))
thetas = PI.Thetas([(1,)], [1])
known = PI.ZB
want = PI.A
println("choose: ")
println(choose(thetas, loc, +, Tuple{Int64, Int64}, want, known, 4, 1))

## testing
args = (3,)
f = simple
types = Tuple{Int}

ir = ParametricInversion.makePGFir(typeof(f), types)
println(ir)
g = IRTools.func(ir)
ϴ = g(nothing, args...)
println("thetas: ", ϴ)

invir = ParametricInversion.invertir(typeof(f), types)
println(invir)
invg = IRTools.func(invir)
out = invg(nothing, f, types, f(args...), ϴ)
println("output of inverse: ", out, ", pgf args: ", args)
@assert(args == out)


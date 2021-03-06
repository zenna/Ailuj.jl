"Jula in reverse: Parametric Inversion in pure Julia"
module ParametricInversion

using InteractiveUtils
using IRTools
using MacroTools
using Spec

using IRTools: Statement, varargs!, insertafter!, xcall, var, IR, Block, blocks, arguments
using IRTools.Inner: Variable 
using IRTools
using IRTools: varargs!, inlineable!, pis!, slots!, IR, var, xcall
using IRTools.Inner: argnames!, update!, argument!

using Mjolnir

export invertapply
# using ZenUtils

include("util.jl")
using .Util

include("duplify.jl")
include("invert.jl")
include("param.jl")
include("primitives.jl")

end
### Starting a new project      
mkdir ex99
cd ex99
julia
;
pkg> activate .
pkg> add Dataframe Plots etc...

### Kicking off testcases

cd ex2
julia

julia> using Pkg
julia> Pkg.activate(".")
julia> Pkg.test()



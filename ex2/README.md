### Starting a new project      
julia \
]
pkg> generate ex99
; \
shell> cd ex99 \
] \
pkg> activate . \
pkg> add Dataframe Plots etc... 

### Kicking off testcases

cd ex2 \
julia \
julia> using Pkg \
julia> Pkg.activate(".") \
julia> Pkg.test() 



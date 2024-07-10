# runtests.jl

using ex2
using Test

N = 2^20
x = fill(1.0f0, N) # a vector filled with 1.0 (Float32)
y = fill(2.0f0, N) # a vector filled with 2.0

y .+= x # increment each element of y with the corresponding element of x

@testset "Sequential and parallel add." begin
    fill!(y, 2)
    ex2.sequential_add!(y, x)
    @test all(y .== 3.0f0)

    fill!(y, 2)
    ex2.parallel_add!(y, x)
    @test all(y .== 3.0f0)
end

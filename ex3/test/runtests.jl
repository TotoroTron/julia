# runtests.jl

using ex3
using Test
using CUDA

N = 2^20
x_d = CUDA.fill(1.0f0, N)
y_d = CUDA.fill(2.0f0, N)

@testset "CUDA vector add." begin
    # y_d .+= x_d
    ex3.add_broadcast!(y_d, x_d)
    @test all(Array(y_d) .== 3.0f0)

end


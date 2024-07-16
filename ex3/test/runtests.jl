# runtests.jl

using ex3
using Test
using CUDA

N = 2^18
x_d = CUDA.fill(1.0f0, N)
y_d = CUDA.fill(2.0f0, N)


@testset "CUDA vector add." begin
    ex3.add_broadcast!(y_d, x_d)
    @test all(Array(y_d) .== 3.0f0)

end

@testset "CUDA Kernel add1." begin
    fill!(y_d, 2.0f0)
    @cuda ex3.gpu_add1!(y_d, x_d)
    @test all(Array(y_d) .== 3.0f0)

end

@testset "CUDA Kernel add2" begin
    fill!(y_d, 2.0f0)
    @cuda threads=256 ex3.gpu_add2!(y_d, x_d)
    @test all(Array(y_d) .== 3.0f0)
end




# https://cuda.juliagpu.org/stable/tutorials/introduction/

module ex3
using CUDA

export add_broadcast
export gpu_add1
export gpu_add2

function add_broadcast!(y, x)
    CUDA.@sync y .+= x
    return
end

function gpu_add1!(y, x)
    CUDA.@sync begin
        for i = 1:length(y)
            @inbounds y[i] += x[i]
        end
        return nothing
    end
end

function gpu_add2!(y, x)
    CUDA.@sync begin
        index = threadIdx().x
        stride = blockDim().x

        for i = index:stride:length(y)
            @inbounds y[i] += x[i]
        end
        return nothing
    end
end 

end # module ex3

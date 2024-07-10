# https://cuda.juliagpu.org/stable/tutorials/introduction/

module ex3
using CUDA

export add_broadcast

function add_broadcast!(y, x)
    CUDA.@sync y .+= x
    return
end

end # module ex3

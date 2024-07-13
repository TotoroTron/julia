module ex4
using CUDA
using Javis

export draw


function ground(args...) 
    background("white") # canvas background
    sethue("black") # pen color
end


function object(p=O, color="black")
    sethue(color)
    circle(p, 25, :fill)
    return p
end


function draw()
    myvideo = Video(500, 500)
    Background(1:70, ground)
    red_ball = Object(1:70, (args...) -> object(O, "red"), Point(100, 0))
    act!(red_ball, Action(anim_rotate_around(2*pi, O)))
    blue_ball = Object(1:70, (args...) -> object(O, "blue"), Point(200, 80))
    act!(blue_ball, Action(anim_rotate_around(2*pi, 0.0, red_ball)))
    render(
        myvideo;
        pathname="circle.gif"
    )
    return
end

end # module ex4

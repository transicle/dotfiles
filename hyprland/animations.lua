hl.config({
    animations = {
        enabled = true
    }
})

hl.curve("myBezier2", {
    type = "bezier",
    points = {{0.05, 0.9}, {0.1, 1.05}}
})

hl.curve("myBezier", {
    type = "bezier",
    points = {{0.22, 1}, {0.36, 1}}
})

hl.curve("easeOutExpo", {
    type = "bezier",
    points = {{0.16, 1}, {0.3, 1}}
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 7,
    bezier = "easeOutExpo"
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 7,
    bezier = "easeOutExpo",
    style = "popin 80%"
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "easeOutExpo"
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 7,
    bezier = "easeOutExpo"
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 6,
    bezier = "myBezier"
})

hl.config({
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
})

-- Swipe horizontally with three fingers to change workspace.
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

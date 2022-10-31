using Gtk, Graphics
c = @GtkCanvas()
win = GtkWindow(c, "Canvas")
@guarded draw(c) do widget
    ctx = getgc(c)
    h = height(c)
    w = width(c)
    circle(ctx, h/2, h/2, h/4)
    set_source_rgb(ctx, 1, 1/2, 0)
    fill(ctx)
end
show(c)

c.mouse.button1press = @guarded (widget, event) -> begin
	  ctx = getgc(widget)
	  set_source_rgb(ctx, 204/255,112/255,0/255)
	  h = height(ctx)
	  w = width(ctx)
	  rectangle(ctx, event.x, event.y, 0.15*w, h/25)
	  fill(ctx)
	  stroke(ctx)
	  reveal(widget)
end

c.mouse.button3press = @guarded (widget, event) -> begin
	   ctx = getgc(widget)
	   set_source_rgb(ctx, 204/255,112/255,0/255)
	   h = height(ctx)
	   w = width(ctx)
	   arc(ctx, event.x, event.y, 15, 0, 2pi)
	   fill(ctx)
	   stroke(ctx)
	   reveal(widget)
end
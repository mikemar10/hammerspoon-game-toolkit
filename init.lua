game = hs.hotkey.modal.new({"cmd", "alt"}, "g")

function game:pause()
  game.paused = not game.paused
end

function game:rng_color()
  return {
    red = math.random(),
    blue = math.random(),
    green = math.random()
  }
end

function game:reset()
  game.paused = false
  game.tick = nil
  screen = hs.screen.primaryScreen()
  canvas_w = 1280
  canvas_h = 720
  canvas_x = (hs.screen.primaryScreen():currentMode().w - canvas_w) / 2
  canvas_y = (hs.screen.primaryScreen():currentMode().h - canvas_h) / 2
  game.canvas = hs.canvas.new({x = canvas_x, y = canvas_y, w = canvas_w, h = canvas_h})
  game.rect = {
    w = 50,
    h = 50,
    x = 1280 / 2 - 50 / 2,
    y = 720 / 2 - 50 / 2,
    dx = (math.random(0,1) == 0 and 1 or -1),
    dy = (math.random(0,1) == 0 and 1 or -1)
  }
  game.canvas[1] = {
    type = "rectangle",
    fillColor = { alpha = 0.7 },
    frame = {
      x = 0,
      y = 0,
      w = canvas_w,
      h = canvas_h
    }
  }
  game.canvas[2] = {
    action = "fill",
    fillColor = game:rng_color(),
    type = "rectangle",
    frame = {
      x = game.rect.x,
      y = game.rect.y,
      w = game.rect.w,
      h = game.rect.h
    }
  }
end

function game:entered()
  hs.alert.show('HAMMERSPOON: THE HOTTEST NEW INDIE GAME ENGINE', { atScreenEdge = 1})
  game.reset()

  game.tick = hs.timer.doEvery(1/60, function()
    game.canvas[2].frame.x = game.rect.x
    game.canvas[2].frame.y = game.rect.y
    game.canvas:show()

    if game.paused then
      return
    end

    game.rect.x = game.rect.x + game.rect.dx
    game.rect.y = game.rect.y + game.rect.dy

    if game.rect.x <= 0 or game.rect.x + game.rect.w >= 1280 then
      game.rect.dx = -game.rect.dx
      game.canvas[2].fillColor = game:rng_color()
    end

    if game.rect.y <= 0 or game.rect.y + game.rect.h >= 720 then
      game.rect.dy = -game.rect.dy
      game.canvas[2].fillColor = game:rng_color()
    end
  end)
end

game:bind('', 'space', function () game:pause() end)
game:bind('', 'escape', function ()
  game.tick:stop()
  game.tick = nil
  game.canvas:hide()
  game:exit()
end)

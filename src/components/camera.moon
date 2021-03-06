
LogicalComponent  = require 'src.components.base.logical_component'
{ :screen }       = require 'config'

class Camera extends LogicalComponent
  new: =>
    super!
    @scale_x    = 1
    @scale_y    = 1
    @to_follow  = nil

  on: =>
    love.graphics.push!
    love.graphics.scale 1 / @scale_x, 1 / @scale_y
    love.graphics.translate screen.width / 2 + -1 * @x, screen.height / 2 + -1 * @y

  off: =>
    love.graphics.pop!

  apply: (fn) =>
    @on!
    fn!
    @off!

  set_position: (x, y) =>
    @x = x
    @y = y

  set_scale: (sx, sy) =>
    @scale_x = sx
    @scale_y = sy

  follow: (entity) =>
    @to_follow = entity

  real_coordinates: (x, y) =>
    @to_follow\get_x! - screen.width / 2 + x, @to_follow\get_y! - screen.height / 2 + y

  update: =>
    if @to_follow
      @set_position(
        @to_follow\get_x! + @to_follow\get_width! / 2,
        @to_follow\get_y! + @to_follow\get_height! / 2
      )

return Camera
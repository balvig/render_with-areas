# frozen_string_literal: true

require_relative "render_with_areas/version"

module RenderWithAreas
  def render_with_areas(*args, &block)
    render ContentAreas.new(*args), &block
  end
end

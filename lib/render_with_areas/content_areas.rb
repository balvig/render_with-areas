module RenderWithAreas
  class ContentAreas
    def initialize(partial_path, locals = {})
      @partial_path = partial_path
      @locals = locals
    end

    def render_in(_view_context, &block)
      @view_context = _view_context
      locals[:content] = view_context.capture(self, &block)
      view_context.render partial: partial_path, locals: locals
    end

    def with(area, content = nil, &block)
      locals[area] = content || view_context.capture(&block)
    end

    private

      attr_reader :partial_path, :view_context, :locals
  end
end

module ActiveAdmin
  class FormBuilder
    def localized_input(name, args = {})
      # form_buffers.last << super(name, args)
      # self.form_buffers.last
      super(name, args)
    end
  end
end

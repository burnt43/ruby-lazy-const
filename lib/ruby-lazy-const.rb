require 'pathname'
require 'active_support'

module RubyLazyConst
  class Config
    class << self
      attr_accessor :base_dir
    end
  end
end

class Object
  CONST_MISSING_DEFINITION =
    proc do |missing_const_name|
      possible_sub_pathname =
        if self == Object
          Pathname.new('.')
        else
          Pathname.new(name.split('::').map {|const_name| ActiveSupport::Inflector.underscore(const_name)}.join('/'))
        end

      possible_pathname =
        Pathname.new(RubyLazyConst::Config.base_dir)
        .join(possible_sub_pathname)
        .join("#{ActiveSupport::Inflector.underscore(missing_const_name.to_s)}.rb")

      if possible_pathname.exist?
        require possible_pathname

        if const_defined?(missing_const_name)
          constant = const_get(missing_const_name)

          constant.define_singleton_method(:const_missing, CONST_MISSING_DEFINITION)

          constant
        else
          super(missing_const_name)
        end
      else
        super(missing_const_name)
      end
    end

  define_singleton_method(:const_missing, CONST_MISSING_DEFINITION)
end

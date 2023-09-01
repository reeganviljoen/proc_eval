module ProcEval

  refine Object do
    def evaluate(*args, **options)
      self
    end
  end # refine Object

  refine Proc do

    def parameter_type_counts
      @parameter_type_counts ||= parameters.each_with_object(Hash.new(0)) {|(param_type, _), counts| counts[param_type] += 1 }
    end

    def generate_parameter_type_counts
      parameters.each_with_object(Hash.new(0)) {|(param_type, _), counts| counts[param_type] += 1 }
    end

    def parameter_type_count(*types)
      parameter_type_counts.values_at(*types).compact.reduce(:+)
    end

    def has_parameter_type?(*types)
      parameter_type_count(*types) > 0
    end

    def has_optional_parameter?
      @has_optional_parameter ||= has_parameter_type?(:rest)
    end

    def has_key_parameter?
      @has_key_parameter ||= has_parameter_type?(:key, :keyreq, :keyrest)
    end

    def required_parameter_count
      @required_parameter_count ||= parameter_type_count(:req, :opt)
    end

    def parameter_count
      @parameter_count ||= has_parameter_type?(:rest) ? Float::INFINITY : required_parameter_count
    end

    # override
    def evaluate(*args, **options)
      if lambda?
        required_args = Array.new(required_parameter_count) {|i| args[i] }
        optional_args = args[required_parameter_count...args.length] if has_optional_parameter?
      else
        required_args, optional_args = args, nil
      end

      if has_key_parameter?
        call(*required_args, *optional_args, **options)
      else
        call(*required_args, *optional_args)
      end
    end

  end # refine Proc
end

require 'proc_eval/version'

require_relative 'lib/proc_eval/version.rb'

Gem::Specification.new do |spec|
  spec.name = 'proc_eval'
  spec.version = ProcEval::VERSION
  spec.authors = ['Brent Jacobs', 'br3nt']
  spec.homepage = 'https://github.com/reeganviljoen/proc_eval'
  spec.required_ruby_version = '>= 2.7'
  spec.summary = 'Allow evaluation of variables, procs, and lambdas with the same level of flexibility.'
  spec.description = <<-DESC
    Adds an `evaulate` refinement method to Proc and Object instances.

    The goal of this gem is to allow evaluation of variables, procs, and lambdas with the same level of flexibility.

    The `evaluate` method has been added to the Object class to simply return the value of the variable.
    The `evaluate` method is overriden on the Proc class to allow parameters to be passed to lambdas in the same flexible way as procs.
    This takes into consideration, required/optional/remaining parameters, and required/optional/remaining keyword parameters.

    For information on Refinements, see:
    - https://ruby-doc.org/core-2.0.0/doc/syntax/refinements_rdoc.html
    - https://ruby-doc.org/core-2.1.0/doc/syntax/refinements_rdoc.html
    - https://ruby-doc.org/core-2.2.0/doc/syntax/refinements_rdoc.html
    - https://ruby-doc.org/core-2.3.0/doc/syntax/refinements_rdoc.html
    - https://ruby-doc.org/core-2.4.0/doc/syntax/refinements_rdoc.html
    - http://yehudakatz.com/2010/11/30/ruby-2-0-refinements-in-practice/
  DESC

  spec.licenses = ['MIT']

  spec.files = [
    'lib/proc_eval.rb',
    'lib/proc_eval/version.rb'
  ]
end

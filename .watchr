# --------------------------------------------------
# Convenience Methods
# --------------------------------------------------
def all_spec_files
  Dir['spec/**/*_spec.rb']
end
 
def run(cmd)
  puts(cmd)
  system(cmd)
end
 
def spec(args)
  run "ruby -rrubygems -S rspec --tty #{args}"
end

def run_all_specs
  spec all_spec_files.join(' ')
end
 
# --------------------------------------------------
# Watchr Rules
# --------------------------------------------------
watch('app/(models/.*).rb')       { |m| spec("spec/%s_spec.rb"      % m[1] ) }
watch('^spec.*/.*_spec\.rb'   )   { |m| spec("%s"                   % m[0] ) }
watch('^lib/(.*)\.rb'         )   { |m| spec("spec/libs/%s_spec.rb" % m[1] ) }
watch('^lib/.*/(.*)\.rb'      )   { |m| spec("spec/libs/%s_spec.rb" % m[1] ) }
watch('^spec/spec_helper\.rb' )   { run_all_specs }
 
# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
# Ctrl-\
Signal.trap('QUIT') do
  puts " --- Running all specs ---\n\n"
  run_all_specs
end
 
# Ctrl-C
Signal.trap('INT') { abort("\n") }

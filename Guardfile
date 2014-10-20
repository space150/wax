# guard 'rake', :task => 'js:dev', :task_args => ['--trace'] do
#   watch(%r{^public/coffee})
# end

guard 'rake', :task => 'wax:build' do
  watch(%r{^Views})
  watch(%r{^wax/data})
  watch(%r{^wax/templates})
  watch(%r{^Waxfile})
end

guard 'rake', :task => 'docs' do
  watch(%r{^public/coffee})
end

guard 'livereload' do
  watch(%r{^wax/build})
  watch(%r{^public})
end

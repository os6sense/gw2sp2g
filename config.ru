require './index'

app = proc do |env|
    [200, { "Content-Type" => "text/html" }, [generate_page]]
end
run app

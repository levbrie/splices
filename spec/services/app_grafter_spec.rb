require_relative "../../app/services/app_grafter"

describe "Grafting a component onto an applicaiton" do
  it "takes an application and a component and creates a graft" do
    app = double
    component = double
    @grafter = AppGrafter.new(app, component)
  end
end

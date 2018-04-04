class BaseQuery
  attr_reader :relation, :params

  DEFAULT_PER = 9

  def initialize(relation, params = {})
    @relation = relation
    @params = params
  end
end

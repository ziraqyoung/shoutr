class SearchService
  attr_reader :term

  def initialize(term:)
    @term = term
  end

  def call
    ShoutSearchQuery.new(term: term).to_relation
  end

  alias results call
end

class SearchService
  attr_reader :term

  def initialize(term:)
    @term = term
  end

  def call
    # Search with Searchkick
    Shout.search term

    # Search without Elasticsearch
    # ShoutSearchQuery.new(term: term).to_relation
  end
end

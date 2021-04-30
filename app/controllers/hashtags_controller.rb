class HashtagsController < ApplicationController
  def show
    # this returns a SearchService instance itself not a Relation
    @search = SearchService.new(term: hashtag)
  end

  private

    def hashtag
      params[:id]
    end
end

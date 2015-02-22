class Article < ActiveRecord::Base
  # attr_accessible :name, :content
  has_many :comments

  private

    def article_params
      # It's mandatory to specify the nested attributes that should be whitelisted.
      # If you use `permit` with just the key that points to the nested attributes hash,
      # it will return an empty hash.
      params.require(:article).permit(:name, :comment)
    end
end

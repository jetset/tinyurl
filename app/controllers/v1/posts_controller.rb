class V1::PostsController < ApplicationController
  before_action :set_post, only: [:show]


  # POST /v1/posts
  def create
    @post = Post.new(post_params)
    #byebug
    if @post.save
      render json: {:tiny_url => @post.tiny_url } , status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # Get /v1/posts/:id
  def show
    if @post
      redirect_to @post.url, status: 302
    else
      render json: {:error => "not_found"}, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by_tiny_url(Post.full_tiny_url params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:url)
    end
end

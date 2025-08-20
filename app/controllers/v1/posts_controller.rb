module V1
  class PostsController < BaseController
    before_action :set_post, only: %i[show update destroy]

    def index
      pagy, records = pagy(Post.order(created_at: :desc), limit: page_size)
      body = PostSerializer.new(records).serializable_hash
      render json: body.merge(meta: pagy_metadata(pagy))
    end

    def show
      render json: PostSerializer.new(@post).serializable_hash
    end

    def create
      post = Post.new(post_params)
      post.file.attach(params[:file]) if params[:file]
      post.save!
      render json: PostSerializer.new(post).serializable_hash, status: :created
    end

    def update
      @post.assign_attributes(post_params)
      @post.file.attach(params[:file]) if params[:file]
      @post.save!
      render json: PostSerializer.new(@post).serializable_hash
    end

    def destroy
      @post.destroy!
      head :no_content
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end

    def page_size
      [ params.fetch(:page_size, 20).to_i, 100 ].min
    end
  end
end

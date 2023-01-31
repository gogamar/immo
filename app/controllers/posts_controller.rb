class PostsController < ApplicationController
  include TranslateHelper
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_post, only: %i[ show edit update destroy update_translations ]

  # GET /posts or /posts.json
  def index
    @posts = policy_scope(Post)
    @pagy, @posts = pagy(@posts, page: params[:page], items: 5)
  end

  # GET /posts/1 or /posts/1.json
  def show
    authorize @post
    @categories = policy_scope(Category)
    @posts = policy_scope(Post)
  end

  def new
    @post = Post.new
    authorize @post
  end


  def edit
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.assign_attributes(
      content_en: translate_string(@post.content_ca, "en"),
      content_es: translate_string(@post.content_ca, "es"),
      content_fr: translate_string(@post.content_ca, "fr")
    )
    authorize @post
    @post.save

    if @post.save
      redirect_to edit_post_path(@post), notice: "Post was successfully saved and translated. Now you can retouch the translations if you want."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update
  authorize @post
    if params[:commit] == "Save translations"
      new_text = params[:post][:content_ca]
      @post.update(content: new_text, content_en: translate_string(new_text, "en"), content_es: translate_string(new_text, "es"), content_fr: translate_string(new_text, "fr"))
      if @post.save
        redirect_to edit_post_path(@post), notice: "Translatiosn successfully saved."
      else
        render :edit, status: :unprocessable_entity
      end
    elsif params[:commit] == "Save"
      if @post.update(post_params)
        redirect_to edit_post_path(@post), notice: "Post was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    authorize @post
    @post.destroy
    redirect_to posts_path, notice: "Post was successfully destroyed."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title_ca, :author, :content_ca, :content_es, :content_fr, :content_en, :photo, :category_id)
  end
end

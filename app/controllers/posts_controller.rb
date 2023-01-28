class PostsController < ApplicationController
  require 'json'
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
    # @content_es = @post.content_es || @translation_es
    # @content_en = @post.content_en || @translation_en
    # @content_fr = @post.content_fr || @translation_fr
    @translation_es = @post.translate_to_es
    @translation_en = @post.translate_to_en
    @translation_fr = @post.translate_to_fr
  end

  def update_translations
    authorize @post
    # @post.update!(content_es: translation_es, content_en: translation_en, content_fr: translation_fr)
    if @post.update(post_params)
      flash[:success] = "Translations successfully updated."
      redirect_to edit_post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    authorize @post

    if @post.save
      flash[:success] = "Post was successfully created."
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update
    authorize @post
    if @post.update(post_params)
      flash[:success] = "Post was successfully updated."
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
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
      params.require(:post).permit(:title, :author, :content, :content_es, :content_fr, :content_en, :photo, :category_id)
    end
end

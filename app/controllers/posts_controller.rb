class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  #before_filter :permission_check, :only =>[:update,:destroy]
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    #@post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])

    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.js { render :json => "#{@post.id}" }
      format.json { render :json => "#{@post.id}" }
    end
  end

  private

  def permission_check
    @post = Post.find(params[:id])
     if @post.user_id != current_user.id
       respond_to do |format|
         format.html do
           flash[:notice] = 'HACK...You dont have permission to modify this message! '
           redirect_to posts_url
          end
         format.js { render :json => 'HACK...You dont have permission to modify this message! ', :status => 403 }
       end
       return
     end
  end

end

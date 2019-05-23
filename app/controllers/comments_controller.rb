class CommentsController < ApplicationController
    before_action :find_haberler

    before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
    before_action :comment_owner, only: [:destroy, :edit, :update]
    def create
        @comment= @haberler.comments.create(params[:comment].permit(:yorum))
        @comment.user_id = current_user.id
        @comment.save
        if @comment.save
            redirect_to haberler_path(@haberler)
        else
            render 'new'
        end
    end
    def destroy
        @comment.destroy
        redirect_to haberler_path(@haberler)
    end
    def edit
    end
    
    def update
        if @comment.update(params[:comment].permit(:yorum))
            redirect_to haberler_path(@haberler)
        else
            render 'edit'
        end
    end
    
    private
    
    def find_haberler
        @haberler = Haberler.find(params[:haberler_id])
    end
    def find_comment
        @comment=@haberler.comments.find(params[:id])
    end
    def comment_owner
        unless current_user.id==@comment.user_id
            flash[:notice]="Yetkiniz yok"
            redirect_to @haberler
        end
    end
    
        
end

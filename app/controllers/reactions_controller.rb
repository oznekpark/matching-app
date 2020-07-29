class ReactionsController < ApplicationController
  def create
    # モデルの新しいインスタンスは作成されるが、その時点ではDBに保存されない(newのみ、DB保存するにはsaveを行う)
    reaction = Reaction.find_or_initialize_by(to_user_id: params[:user_id], from_user_id: current_user.id)
    # update_attributesはデータベースの値を複数同時に更新するために利用
    reaction.update_attributes(status: params[:reaction])
  end
end

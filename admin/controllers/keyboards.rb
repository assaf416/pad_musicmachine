PadMusicalBox::Admin.controllers :keyboards do
  get :index do
    @title = "Keyboards"
    @keyboards = Keyboard.all
    render 'keyboards/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'keyboard')
    @keyboard = Keyboard.new
    render 'keyboards/new'
  end

  post :create do
    @keyboard = Keyboard.new(params[:keyboard])
    if @keyboard.save
      @title = pat(:create_title, :model => "keyboard #{@keyboard.id}")
      flash[:success] = pat(:create_success, :model => 'Keyboard')
      params[:save_and_continue] ? redirect(url(:keyboards, :index)) : redirect(url(:keyboards, :edit, :id => @keyboard.id))
    else
      @title = pat(:create_title, :model => 'keyboard')
      flash.now[:error] = pat(:create_error, :model => 'keyboard')
      render 'keyboards/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "keyboard #{params[:id]}")
    @keyboard = Keyboard.find(params[:id])
    if @keyboard
      render 'keyboards/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'keyboard', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "keyboard #{params[:id]}")
    @keyboard = Keyboard.find(params[:id])
    if @keyboard
      if @keyboard.update_attributes(params[:keyboard])
        flash[:success] = pat(:update_success, :model => 'Keyboard', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:keyboards, :index)) :
          redirect(url(:keyboards, :edit, :id => @keyboard.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'keyboard')
        render 'keyboards/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'keyboard', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Keyboards"
    keyboard = Keyboard.find(params[:id])
    if keyboard
      if keyboard.destroy
        flash[:success] = pat(:delete_success, :model => 'Keyboard', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'keyboard')
      end
      redirect url(:keyboards, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'keyboard', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Keyboards"
    unless params[:keyboard_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'keyboard')
      redirect(url(:keyboards, :index))
    end
    ids = params[:keyboard_ids].split(',').map(&:strip)
    keyboards = Keyboard.find(ids)
    
    if Keyboard.destroy keyboards
    
      flash[:success] = pat(:destroy_many_success, :model => 'Keyboards', :ids => "#{ids.to_sentence}")
    end
    redirect url(:keyboards, :index)
  end
end

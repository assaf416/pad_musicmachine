PadMusicalBox::Admin.controllers :instruments do
  get :index do
    @title = "Instruments"
    @instruments = Instrument.all
    render 'instruments/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'instrument')
    @instrument = Instrument.new
    render 'instruments/new'
  end

  post :create do
    @instrument = Instrument.new(params[:instrument])
    if @instrument.save
      @title = pat(:create_title, :model => "instrument #{@instrument.id}")
      flash[:success] = pat(:create_success, :model => 'Instrument')
      params[:save_and_continue] ? redirect(url(:instruments, :index)) : redirect(url(:instruments, :edit, :id => @instrument.id))
    else
      @title = pat(:create_title, :model => 'instrument')
      flash.now[:error] = pat(:create_error, :model => 'instrument')
      render 'instruments/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "instrument #{params[:id]}")
    @instrument = Instrument.find(params[:id])
    if @instrument
      render 'instruments/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'instrument', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "instrument #{params[:id]}")
    @instrument = Instrument.find(params[:id])
    if @instrument
      if @instrument.update_attributes(params[:instrument])
        flash[:success] = pat(:update_success, :model => 'Instrument', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:instruments, :index)) :
          redirect(url(:instruments, :edit, :id => @instrument.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'instrument')
        render 'instruments/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'instrument', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Instruments"
    instrument = Instrument.find(params[:id])
    if instrument
      if instrument.destroy
        flash[:success] = pat(:delete_success, :model => 'Instrument', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'instrument')
      end
      redirect url(:instruments, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'instrument', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Instruments"
    unless params[:instrument_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'instrument')
      redirect(url(:instruments, :index))
    end
    ids = params[:instrument_ids].split(',').map(&:strip)
    instruments = Instrument.find(ids)
    
    if Instrument.destroy instruments
    
      flash[:success] = pat(:destroy_many_success, :model => 'Instruments', :ids => "#{ids.to_sentence}")
    end
    redirect url(:instruments, :index)
  end
end

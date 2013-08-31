PadMusicalBox::App.controllers :performer do
  
  get :keyboards do
    render('performer/keyboards', :layout => :application)
  end

  get :guitar do
     render('/performer/guitar', :layout => :application)
  end

  get :drums do

  end

  get :sounds do

  end

  get :songs do

  end

  get :midiplayer do

  end

  
  get :midifiles do

  end

end

get '/albums/new' do
  erb :'albums/new'
end

post '/albums' do
  @album = Album.create(params[:album])
  redirect "/albums/#{@album.id}"
end

get '/albums/:id' do
  @album = Album.find params[:id]
  @photos = @album.photos
  erb :'albums/show'
end

post '/albums/:id/photos' do
  #Find Album
  @album = Album.find params[:id]
  #Creates Photo
  @photo = Photo.new
  @photo.name = params[:photo][:name]
  @photo.file = params[:image]
  @photo.save
  @album.photos << @photo

  redirect "/albums/#{@album.id}/photos/#{@photo.id}"
end

get '/albums/:a_id/photos/:p_id' do
  @album = Album.find params[:a_id]
  @photo = Photo.find params[:p_id]
  erb :'photos/show'
end
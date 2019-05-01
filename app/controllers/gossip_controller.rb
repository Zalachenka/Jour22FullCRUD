class GossipController < ApplicationController
  add_flash_types :success , :danger

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @gossip = Gossip.find(params[:id])
   @user = Gossip.find(params[:id]).user.id
   end

  def new
    # Méthode qui crée un potin vide et l'envoie une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @gossip = Gossip.new
    @user  = User.new(city_id: 4)

  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    @gossip = Gossip.create(title: params[:title], content: params[:content], user_id: 2)
    @user = User.create(first_name: params[:author_name], city_id: 4)

    if @gossip.valid?
      redirect_to '/home' , success: "The super potin was succesfully saved !"
    else
      render 'new' , danger: "Error : you need to complete this field "
      puts 'Gossip is invalid'

      end
  end

  def edit
     @gossip = Gossip.find(params[:id])
  end

  def update
     @gossip = Gossip.find(params[:id])
     gossip_params = params.require(:gossip).permit(:title, :content)
     @gossip.update(gossip_params)

      if @gossip.update(gossip_params)
      redirect_to @gossip

      else render :edit
      end
   end

   def destroy
   end

end

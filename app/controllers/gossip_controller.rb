class GossipController < ApplicationController
  add_flash_types :success , :danger

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @gossip = Gossip.all[params[:id].to_i]
   end

  def new
    # Méthode qui crée un potin vide et l'envoie une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @gossip = Gossip.new
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    @gossip = Gossip.create(title: params[:title], content: params[:content], user_id: 2)
    # puts params

    if @gossip.valid?
      redirect_to '/home' , success: "The super potin was succesfully saved !"
    else
      render 'new' , danger: "Error : you need to complete this field "
      puts 'Gossip is invalid'

      end
  end

  def gossip_params
    params.require(:gossip).permit(:content)
  end
end

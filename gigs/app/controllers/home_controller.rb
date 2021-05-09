class HomeController < ApplicationController
  def index
  end

  def about
     
    @about_me = "Texto sobre la idea"

  end

  def balance
     
    @balance = "Aqu'i va el balance de bolos"

    @gigs_factura = current_user.gigs.where('gig_type' => "Factura").count

    @gigs_altass = current_user.gigs.where('gig_type' => "Alta").count

    @gigs_b = current_user.gigs.where('gig_type' => "B").count

   


  end

  
end

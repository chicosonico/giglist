class HomeController < ApplicationController
  def index
  end

  def about
     
    @about_me = "Texto sobre la idea"

  end


  def balance

    if user_signed_in?
     
    @balance = "Aqu'i va el balance de bolos"

    @gigs_factura = current_user.gigs.where('gig_type' => "Factura").count

    @gigs_altass = current_user.gigs.where('gig_type' => "Alta").count

    @gigs_b = current_user.gigs.where('gig_type' => "B").count

    @gigs_factura_indirecta = current_user.gigs.where('gig_type' => "Factura Indirecta").count



    @gigs_total_amount_factura = current_user.gigs.where('gig_type' => "Factura").sum(:gig_cache)
    
    @gigs_total_amount_b = current_user.gigs.where('gig_type' => "B").sum(:gig_cache)

    @gigs_total_amount_altass = current_user.gigs.where('gig_type' => "Alta").sum(:gig_cache)

    @gigs_total_amount_factura_indirecta = current_user.gigs.where('gig_type' => "Factura Indirecta").sum(:gig_cache)

    @gigs_total_amount_altas_all = @gigs_total_amount_altass + @gigs_total_amount_factura_indirecta


    else

    @balance = "Aqu'i va el balance de bolos"
    
    end


   
  end

  
end

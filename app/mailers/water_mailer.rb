class WaterMailer < ApplicationMailer

  def send_mail(grow_plant)
    @grow_plant = grow_plant
    @url = "https://ac0760b4db514bf8b93a7e6446ec407c.vfs.cloud9.us-east-1.amazonaws.com/"
    mail(
      to: grow_plant.user.email,
      subject: '今日は植物の水やり日です'
    ) do |format|
      format.html
    end

  end

end
